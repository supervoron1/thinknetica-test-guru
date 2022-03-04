class AddColumnCorrectToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :correct, :boolean, default: false, null: false
  end
end
