class PassedTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question, :before_update_check_success, :before_update_send_mail

  SUCCESS_PERCENT = 85

  def completed?
    # current_question.nil?
    taken_questions == test_questions.count
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    self.taken_questions += 1

    save!
  end

  def result
    (self.correct_questions * 100) / test_questions.count
  end

  def success?
    result >= SUCCESS_PERCENT
  end

  # Using 'taken_questions' attribute instead
  # def question_position
  #   self.test&.questions.find_index(current_question) + 1
  # end

  def test_questions
    self.test&.questions
  end

  def time_left
    (self.created_at + self.test&.timer.minutes - Time.now).round if self.test.timer
  end

  def time_expired?
    self.time_left <= 0
  end

  private

  def before_validation_set_first_question
    self.current_question = test_questions.first
  end

  def before_update_set_next_question
    self.current_question = next_question
  end

  def before_update_check_success
    self.success = self.success? if self.completed?
  end

  def before_update_send_mail
    TestsMailer.completed_test(self).deliver_now if self.completed?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count

    # if only one condition
    # Answer.find_by(id: answer_id)&.correct
    # or
    # Answer.where(id: answer_id).pluck(:correct)
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test_questions.order(:id).where('id > ?', current_question.id).first
  end
end
