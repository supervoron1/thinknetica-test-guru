class AddNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:categories, :title, false)
    change_column_null(:questions, :body, false)
    change_column_null(:users, :login, false)
    change_column_null(:users, :email, false)
  end
end
