class User < ApplicationRecord
  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  def tests_by_level(level)
    # Test.joins('LEFT JOIN passed_tests ON passed_tests.test_id = test.id')
    #     .where(passed_tests: { user_id: self.id }, level: level)
    tests.where(level: level)
  end
end
