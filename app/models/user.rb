require 'digest/sha1'

class User < ApplicationRecord

  # Not used. Custom auth before embedded `has_secure_password` was engaged
  # include Auth

  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password

  def tests_by_level(level)
    # Test.joins('LEFT JOIN passed_tests ON passed_tests.test_id = test.id')
    #     .where(passed_tests: { user_id: self.id }, level: level)
    tests.where(level: level)
  end

  def test_passage(test)
    passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

end
