# frozen_string_literal: true

# https://leetcode.com/problems/number-of-ways-to-stay-in-the-same-place-after-some-steps/
# TODO:

# @param {Integer} steps
# @param {Integer} arr_len
# @return {Integer}
def num_ways(steps, arr_len)
  return 1 if steps == 1
  return 1 if arr_len == 1

  total = 0

  (0...steps).step(2).each do |less_steps|
    total += stars_and_bars(
      num_ways_lr(less_steps, arr_len),
      steps - less_steps
    )
  end

  total
end

def num_ways_lr(steps, arr_len)
  return 0 if steps.odd?
  return 0 if arr_len <= 1

  return unless steps / 2 <= arr_len

  fact(steps) / 2
end

def cnk(n, k) = fact(n) / (fact(k) * fact(n - k))
def fact(n) = (1..n).reduce(1, :*)
def stars_and_bars(stars, bars) = cnk(stars + bars, bars)

require 'test/unit'

class TestFunc < Test::Unit::TestCase
  def run_cases(method_ref, cases)
    cases.each do |args, expected_result|
      actual_result = method_ref.call(*args)
      assert_equal(
        expected_result, actual_result,
        "#{method_ref.name}(#{args.join(', ')}) expected to equal" \
        "#{expected_result}, but was #{actual_result}"
      )
    end
  end

  def test_fact
    run_cases(method(:fact), {
                1 => 1,
                2 => 2,
                3 => 6,
                4 => 24,
                5 => 120,
                6 => 720
              })
  end

  def test_cnk
    run_cases(method(:cnk), {
                [5, 3] => 10,
                [6, 3] => 20,
                [6, 6] => 1,
                [5, 5] => 1,
                [2, 1] => 2,
                [6, 4] => 15,
                [4, 2] => 6
              })
  end

  def test_stars_and_bars
    run_cases(method(:stars_and_bars), {
                [2, 2] => 6
              })
  end

  def test_num_ways_lr
    run_cases(method(:num_ways_lr), {
                [2, 4] => 1, # RL
                [3, 2] => 0, # can't do 3 steps and get to initial index
                [4, 2] => 2, # RLRL, RRLL
                [4, 1] => 0, # can't move
                [4, 3] => 2, # RLRL, RRLL
                [6, 3] => 4, # RLRLRL, RRLLRL, RRRLLL, RRLRLL
                [6, 9] => 4 # ^
              })
  end

  def test_num_ways
    run_cases(method(:num_ways), {
                [2, 4] => 2,
                [3, 2] => 4,
                [4, 2] => 8
              })
  end
end
