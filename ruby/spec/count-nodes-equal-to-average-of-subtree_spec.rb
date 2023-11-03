# frozen_string_literal: true

require "test/unit"
require "timeout"

require_relative "../count-nodes-equal-to-average-of-subtree"
require_relative "../lib/tree_node"

# Test
class AverageOfSubtreeTest < Test::Unit::TestCase
  def test_examples
    assert_equal 2, average_of_subtree(TreeNode[8, 0, 1])
    assert_equal 5, average_of_subtree(TreeNode[4, 8, 5, 0, 1, nil, 6])
  end
end
