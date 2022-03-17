class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests

  # also needs migration to add unique indexes to attributes: title and level
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :advanced, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category_title) { joins(:category).where(categories: { title: category_title }) }

  def self.sort_by_category(category_title)
    # Test.joins("JOIN categories ON categories.id = tests.category_id")
    #     .where("categories.title = ?", category).order(title: :desc).pluck(:title)
    # Simplified using associations
    # Test.joins(:category).where(categories: { title: category_title }).order(title: :desc).pluck(:title)
    # Using scope
    by_category(category_title).order(title: :desc).pluck(:title)
  end
end
