class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_answers

  def validate_max_answers
    errors.add(:question, "Each question can't have more than 4 answers") if question.answers.size > 4
  end
end
