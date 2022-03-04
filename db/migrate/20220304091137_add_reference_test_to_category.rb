class AddReferenceTestToCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :category, foreign_key: true
  end
end
