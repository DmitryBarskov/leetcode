# frozen_string_literal: true

# https://leetcode.com/problems/find-mode-in-binary-search-tree/

require_relative "lib/tree_node"

def dfs(node, &)
  Enumerator.new do |traverse|
    recursive_dfs(node) { traverse.yield(_1) }
  end.each(&)
end

def recursive_dfs(node, &block)
  return if node.nil?

  recursive_dfs(node.left, &block)
  block.call(node)
  recursive_dfs(node.right, &block)
end

# @param {TreeNode} root
# @return {Integer[]}
def find_mode(root)
  initial_state = {row: 0, max_row: 0, current: nil, winners: []}
  dfs(root).each_with_object(initial_state) do |node, state|
    number = node.val
    if number == state[:current]
      state[:row] += 1
    else
      state[:row] = 1
      state[:current] = number
    end
    state[:winners] << number if state[:row] == state[:max_row]
    if state[:row] > state[:max_row]
      state[:max_row] = state[:row]
      state[:winners] = [number]
    end
  end[:winners]
end
