class PassedTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question
end
