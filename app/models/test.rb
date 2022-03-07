class Test < ApplicationRecord
  def self.sort_by_category(category)
    Test.joins("JOIN categories c ON c.id = tests.category_id")
        .where("c.title = ?", category).order(title: :desc).pluck(:title)
  end
end
