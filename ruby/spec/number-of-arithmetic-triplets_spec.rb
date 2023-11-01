# frozen_string_literal: true

require 'test/unit'
require 'json'

require_relative '../number-of-arithmetic-triplets'

# Test
class NumberOfArithmeticTriplets < Test::Unit::TestCase
  def test_examples
    assert_equal(2, arithmetic_triplets([0, 1, 4, 6, 7, 10], 3))
    assert_equal(2, arithmetic_triplets([4, 5, 6, 7, 8, 9], 2))
  end
end
