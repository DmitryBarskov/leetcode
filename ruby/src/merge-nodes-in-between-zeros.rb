# frozen_string_literal: true

require_relative '../lib/tree_node'

class ListNode
  def each
    iter = self
    while iter
      yield iter.val
      iter = iter.next
    end
  end
end

# @param {ListNode} head
# @return {ListNode}
def merge_nodes(head)
  ref = ListNode.new
  tail = ref
  state = :space
  head.each do |val|
    case [state, val]
    in :space, 0
    in :space, v
      tail.next = ListNode.new(v)
      tail = tail.next
      state = :sum
    in :sum, 0
      state = :space
    in :sum, _
      tail.val += val
    end
  end
  ref.next
end
