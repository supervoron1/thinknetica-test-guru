class AddTimerToTests < ActiveRecord::Migration[6.1]
  def up
    add_column :tests, :timer, :integer
    Test.all.each do |test|
      test.update_column(:timer, 5)
    end
  end

  def down
    remove_column :tests, :timer
  end
end
