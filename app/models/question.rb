class Question < ApplicationRecord
  has_many :answers
  belongs_to :test
  has_many :gists, dependent: :destroy

  validates :body, presence: true
end
