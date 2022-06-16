class AddSuccessToPassedTests < ActiveRecord::Migration[6.1]
  def up
    add_column :passed_tests, :success, :boolean, default: false
    PassedTest.all.each do |passage|
      passage.update_column(:success, true) if passage.success?
    end
  end

  def down
    remove_column :passed_tests, :success
  end
end
