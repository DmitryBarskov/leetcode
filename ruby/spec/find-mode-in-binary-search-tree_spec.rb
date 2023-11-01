# frozen_string_literal: true

require 'test/unit'

require_relative '../lib/tree_node'
require_relative '../find-mode-in-binary-search-tree'

# Test
class FindModeTest < Test::Unit::TestCase
  def test_examples
    assert_equal [2], find_mode(TreeNode.from_array([1, nil, 2, 2]))
    assert_equal [0], find_mode(TreeNode.new(0))
  end

  def test_failed
    assert_equal [1, 2], find_mode(TreeNode.from_array([1, nil, 2]))
    assert_equal [0, 1],
                 find_mode(TreeNode.from_array([1, 0, 1, 0, 0, 1, 1, 0]))
    assert_equal [1], find_mode(TreeNode.from_array([1, 1, 2]))
  end
end
