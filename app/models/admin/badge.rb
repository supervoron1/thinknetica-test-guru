class Admin::Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, presence: true
  validates :file_name, presence: true
  validates :badge_type, presence: true

  enum badge_type: { all_categories: 0, all_levels: 1, first_try: 2 }
end
