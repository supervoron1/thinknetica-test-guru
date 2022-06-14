class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
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
    all_passages_on_category = @user.test_passages.where(current_question_id: nil, test: all_tests_on_category, success: true).pluck(:test_id).uniq
    all_tests_on_category.sort == all_passages_on_category.sort
  end

  def all_levels(level)
    all_tests_on_level = Test.where(level: level.to_i).pluck(:id)
    all_passages_on_level = @user.test_passages.where(current_question_id: nil, test: all_tests_on_level, success: true).pluck(:test_id).uniq
    all_tests_on_level.sort == all_passages_on_level.sort
  end

  def first_try()
    TestPassage.where(user: @test_passage.user, test: @test_passage.test).count == 1
  end
end
