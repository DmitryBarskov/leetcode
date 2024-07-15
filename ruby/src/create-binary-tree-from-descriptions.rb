# Definition for a binary tree node.
# TreeNode = Struct.new(:val, :left, :right)
# @param {Integer[][]} descriptions
# @return {TreeNode}
def create_binary_tree(descriptions)
  nodes = {}
  possible_roots = Set.new
  impossible_roots = Set.new
  descriptions.each do |parent, child, isLeft|
    nodes[parent] ||= TreeNode.new(parent)
    nodes[child] ||= TreeNode.new(child)
    if isLeft == 1
      nodes[parent].left = nodes[child]
    else
      nodes[parent].right = nodes[child]
    end
    if !impossible_roots.include?(parent)
      possible_roots.add(parent)
    end
    possible_roots.delete(child)
    impossible_roots.add(child)
  end
  nodes[possible_roots.first]
end
