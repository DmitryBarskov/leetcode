# @param {TreeNode} root
# @param {Integer[]} to_delete
# @return {TreeNode[]}
def del_nodes(root, to_delete)
  to_delete = to_delete.to_set

  forest = { root.val => root }
  dfs(root) do |node|
    deleted_nodes = []
    if to_delete.include?(node.left&.val)
      deleted_nodes.push(node.left)
      node.left = nil
    end
    if to_delete.include?(node.right&.val)
      deleted_nodes.push(node.right)
      node.right = nil
    end
    if to_delete.include?(node.val)
      deleted_nodes.push(node)
    end
    deleted_nodes.each do |deleted_node|
      forest.delete(deleted_node.val)
      forest[deleted_node.left.val] = deleted_node.left if deleted_node.left
      forest[deleted_node.right.val] = deleted_node.right if deleted_node.right
    end
  end
  forest.values
end

def dfs(root)
  stack = [root]

  while stack.any?
    node = stack.pop
    next if node.nil?

    stack.push(node.right)
    stack.push(node.left)
    yield node
  end
end
