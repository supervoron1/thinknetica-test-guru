class BadgeService
  def initialize(passed_test)
    @passed_test = passed_test
    @user = @passed_test.user
    @test = @passed_test.test
  end

  def call
    @badges = []
    Badge.all.select do |badge|
      @badges << badge if send(badge.badge_type.to_s, badge.condition)
    end
  end

  private

  def all_categories(category)
    all_tests_on_category = Test.by_category(category).pluck(:id)
    all_passages_on_category = @user.passed_tests.where(current_question_id: nil, test_id: all_tests_on_category, success: true).pluck(:test_id).uniq
    all_tests_on_category.sort == all_passages_on_category.sort
  end

  def all_levels(level)
    all_tests_on_level = Test.where(level: level.to_i).pluck(:id)
    all_passages_on_level = @user.passed_tests.where(current_question_id: nil, test_id: all_tests_on_level, success: true).pluck(:test_id).uniq
    all_tests_on_level.sort == all_passages_on_level.sort
  end

  def first_try(_option)
    PassedTest.where(user: @passed_test.user, test: @passed_test.test).count == 1
  end
end
