# frozen_string_literal: true

require "test/unit"
require "timeout"

module Test
  def self.call(method_name, leetcode_input, expected, focus: nil, &before_compare)
    before_compare ||= proc { |x| x }

    m = method(method_name)
    test_params = leetcode_input.lines.each_slice(m.arity).zip(expected.lines, 1..)
    
    Class.new(Test::Unit::TestCase) do
      test_params.each do |params, expected_result, index|
        next if focus && index != focus
        define_method("test_example_#{index}") do
          Timeout.timeout(3) do
            actual_result = m.call(*params.map { |param| eval(param) })

            expected_result = eval(expected_result)
            assert_equal(before_compare.call(expected_result), before_compare.call(actual_result), "Fail for test #{index}:\n#{params.join}")
          end
        end
      end
    end
  end
end
