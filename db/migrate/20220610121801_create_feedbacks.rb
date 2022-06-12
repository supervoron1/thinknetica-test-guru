class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.references :user, foreign_key: true
      t.string :text, null: false

      t.timestamps
    end
  end
end
