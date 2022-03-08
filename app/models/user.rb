class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('LEFT JOIN passed_tests ON passed_tests.test_id = test.id')
        .where(passed_tests: { user_id: self.id }, level: level)
  end
end
