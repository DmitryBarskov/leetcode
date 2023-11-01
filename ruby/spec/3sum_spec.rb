# frozen_string_literal: true

require 'test/unit'
require 'json'

require_relative '../3sum'

# test
class ThreeSum < Test::Unit::TestCase
  def assert_arrays_equal(expected, actual)
    sorted_expected = expected.map(&:sort).sort
    sorted_actual = actual.map(&:sort).sort
    assert_equal(
      sorted_expected, sorted_actual,
      "Missing elements: #{sorted_expected - sorted_actual}," \
      "extra elements: #{sorted_actual - sorted_expected}"
    )
  end

  def test_examples
    assert_arrays_equal([[-1, -1, 2], [-1, 0, 1]],
                        three_sum([-1, 0, 1, 2, -1, -4]))
    assert_arrays_equal([], three_sum([0, 1, 1]))
    assert_arrays_equal([[0, 0, 0]], three_sum([0, 0, 0]))
  end

  def test_tle
    large_example = fixture_file['large_example']

    require 'timeout'

    Timeout.timeout(2) do
      actual_result = three_sum(large_example['input'])

      # require 'byebug'; byebug
      assert_arrays_equal(large_example['expected'], actual_result)
    end
  end

  def test_zeroes_tle
    zeroes = fixture_file['zeroes']

    require 'timeout'

    Timeout.timeout(2) do
      actual_result = three_sum(zeroes['input'])

      assert_arrays_equal(zeroes['expected'], actual_result)
    end
  end

  private

  def fixture_file
    @fixture_file ||= begin
      path = "#{__dir__}/../../fixtures/3sum.json"
      JSON.parse(File.read(File.expand_path(path)))
    end
  end
end
