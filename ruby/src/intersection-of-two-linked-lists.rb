# Definition for singly-linked list.
# ListNode = Struct.new :val, :next
# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
  a = find_length_and_last_node(headA)
  b = find_length_and_last_node(headB)
  return nil if a[1] != b[1]

  a_it = headA
  (a[0] - b[0]).times { a_it = a_it.next }

  b_it = headB
  (b[0] - a[0]).times { b_it = b_it.next }

  while a_it != b_it
    a_it = a_it.next
    b_it = b_it.next
  end
  a_it
end

def find_length_and_last_node(list)
  length_and_last = [0, list]
  it = list
  while it
    length_and_last[0] += 1
    length_and_last[1] = it
    it = it.next
  end
  length_and_last
end
