class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('LEFT JOIN passed_tests pt ON pt.test.id = test.id')
        .where(passed_tests: { user_id: self.id }, level: level)
  end
end
