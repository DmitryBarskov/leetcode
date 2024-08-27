# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[int]}
def postorder(root)
  traversal = []

  stack = Array(root)
  ready = Set.new
  until stack.empty?
    node = stack.pop
    if ready.include?(node)
      traversal.append(node.val)
    else
      stack.push(node)
      node.children.reverse_each { stack.push(_1) }
      ready.add(node)
    end
  end

  traversal
end
