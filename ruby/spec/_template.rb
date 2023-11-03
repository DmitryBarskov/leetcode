# frozen_string_literal: true

require "test/unit"
require "timeout"

require_relative "../#{File.basename(__FILE__).delete_suffix("_spec.rb")}"

# Test
Class.new(Test::Unit::TestCase) do
  def test_examples
    # TODO: add tests
  end
end
