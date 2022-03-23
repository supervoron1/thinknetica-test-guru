module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :intermediate, 3 => :advanced, 4 => :hard }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end
end
