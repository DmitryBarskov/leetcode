require "minitest/autorun"
require "minitest/benchmark"

require_relative "../src/student-attendance-record-ii"

class TestCheckRecord < Minitest::Test
  def test_basic
    assert_equal 8, check_record(2)
    assert_equal 3, check_record(1)
    assert_equal 530803311, check_record(28)
    assert_equal 9569297, check_record(29)
  end

  def test_large
    assert_equal 183236316, check_record(10101)
    assert_equal 296857007, check_record(99997)
  end

  def bench_linear
    bench_performance_linear :check_record do |n|
      100.times { check_record(n) }
    end
  end
end
