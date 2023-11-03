# frozen_string_literal: true

require 'test/unit'
require 'timeout'

require_relative "../#{File.basename(__FILE__).delete_suffix('_spec.rb')}"

# Test
Class.new(Test::Unit::TestCase) do
  # def test_examples
  #   assert_equal 3, coin_change([1, 2, 5], 11)
  #   assert_equal -1, coin_change([2], 3)
  #   assert_equal 0, coin_change([1], 0)
  # end

  # def test_exchange
  #   assert_equal 2, coin_change([1, 5, 10, 25, 50], 11)
  # end

  # def test_large
  #   Timeout.timeout(2) do
  #     assert_equal 200, coin_change([1, 5, 10, 25, 50], 10_000)
  #   end
  # end

  # def test_large_fail
  #   Timeout.timeout(2) do
  #     assert_equal -1, coin_change([3, 9, 27, 81, 243], 10_000)
  #   end
  # end

  def test_failed
    assert_equal 2, coin_change([1, 3, 5], 2)
  end
end
