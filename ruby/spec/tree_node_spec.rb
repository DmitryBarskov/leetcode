# frozen_string_literal: true

require_relative "../lib/tree_node.rb"

TreeNode.new(
  8,
  TreeNode.new(
    3,
    TreeNode.new(1),
    TreeNode.new(
      6,
      TreeNode.new(4),
      TreeNode.new(7)
    ),
  ),
  TreeNode.new(
    10,
    nil,
    TreeNode.new(
      14,
      TreeNode.new(13),
      nil
    )
  )
).to_a => [8, 3, 10, 1, 6, nil, 14, nil, nil, 4, 7, 13]
