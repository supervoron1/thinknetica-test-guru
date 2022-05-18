class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :passed_tests
  has_many :tests, through: :passed_tests
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    passed_tests.order(id: :desc).find_by(test_id: test.id)
  end

  def is_admin?
    self.type == 'Admin'
  end
end
