# frozen_string_literal: true

require "test/unit"
require "timeout"

require_relative "../course-schedule"
require_relative "../lib/tree_node"

# Test
class CourseScheduleTest < Test::Unit::TestCase
  def test_examples
    assert_equal(true, can_finish(2, [[1, 0]]))
    assert_equal(false, can_finish(2, [[1, 0], [0, 1]]))
    assert_equal(true, can_finish(5, [[1, 4], [2, 4], [3, 1], [3, 2]]))
  end

  def test_loop
    assert_equal(false, can_finish(1, [[0, 0]]))
  end

  def test_no_loop
    assert_equal true, can_finish(2, [[0, 1]])
  end

  def test_medium_example
    courses = fixture_file["medium"]

    Timeout.timeout(2) do
      assert_equal courses["expected"], can_finish(*courses["args"])
    end
  end

  def test_large_example
    courses = fixture_file["large"]

    Timeout.timeout(2) do
      assert_equal courses["expected"], can_finish(*courses["args"])
    end
  end

  def test_multiple_components
    assert_equal(false, can_finish(4, [[0, 1], [3, 2], [2, 3]]))
  end

  def test_failed
    assert_equal false, can_finish(4, [[0, 1], [3, 1], [1, 3], [3, 2]])
  end

  def fixture_file
    @fixture_file ||= begin
      path = "#{__dir__}/../../fixtures/course-schedule.json"
      JSON.parse(File.read(File.expand_path(path)))
    end
  end
end
