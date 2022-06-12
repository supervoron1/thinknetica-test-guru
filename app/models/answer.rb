class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  # validate :validate_max_answers

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers
    errors.add(:question, "Each question can't have more than 4 answers") if question.answers.size > 4
  end
end
