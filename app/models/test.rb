class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests

  def self.sort_by_category(category)
    Test.joins("JOIN categories ON categories.id = tests.category_id")
        .where("categories.title = ?", category).order(title: :desc).pluck(:title)
  end
end
