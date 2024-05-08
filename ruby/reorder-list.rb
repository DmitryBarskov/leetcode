# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  as_array = []
  node = head
  while node
    as_array.push(node)
    node = node.next
    as_array.last.next = nil
  end

  i = 0
  j = as_array.length - 1
  while i < j
    li = as_array[i]
    lj = as_array[j]

    li.next = lj
    break if i + 1 == j
    lj.next = as_array[i + 1]

    i += 1
    j -= 1
  end
end
