require "minitest/autorun"

require_relative "../src/the-number-of-beautiful-subsets"

class TestBeautifulSubsets < Minitest::Test
  def test_exampels
    assert_equal 4, beautiful_subsets([2,4,6], 2)
    assert_equal 1, beautiful_subsets([1], 1)
  end

  def test_corner_cases
    assert_equal 143, beautiful_subsets([18, 12, 10, 5, 6, 2, 18, 3], 8)
    assert_equal 23, beautiful_subsets([10,4,5,7,2,1], 3)
  end
end
