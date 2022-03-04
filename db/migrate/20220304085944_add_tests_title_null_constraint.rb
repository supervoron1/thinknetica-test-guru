class AddTestsTitleNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tests, :title, false)
  end

  # not needed since `change_column_null` is reversible (ActiveRecord::Migration::CommandRecorder for details)
  # def up
  #   change_column_null(:tests, :title, false)
  # end

  # def down
  #   change_column_null(:tests, :title, true)
  # end
end
