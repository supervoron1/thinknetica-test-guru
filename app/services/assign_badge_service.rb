class AssignBadgeService
  def initialize(passed_test)
    @passed_test = passed_test
    @user = @passed_test.user
    @test = @passed_test.test
  end

  def call
    Badge.all.select do |badge|
      @user.badges << badge if send(badge.badge_type.to_s, badge.condition) && !@user.badges.exists?(badge.id)
    end
  end

  private

  def all_categories(category)
    category = Category.find_by_title(category)
    passed_tests_count = @user.passed_tests.where(test_id: category.test_ids, success: true).uniq.count
    passed_tests_count == category.test_ids.count
  end

  def all_levels(level)
    all_tests_on_level = Test.where(level: level.to_i)
    all_passages_on_level_count = @user.passed_tests.where(test_id: all_tests_on_level, success: true).uniq.count
    all_tests_on_level.count == all_passages_on_level_count
  end

  def first_try(_option)
    @user.passed_tests.where(test: @test).count == 1
  end
end
