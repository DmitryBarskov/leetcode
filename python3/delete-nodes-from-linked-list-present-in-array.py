from typing import List, Optional


# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def modifiedList(self, nums: List[int], head: Optional[ListNode]) -> Optional[ListNode]:
        to_remove = set(nums)

        result_ref = ListNode(0)
        res = result_ref
        it = head
        while it is not None:
            if it.val not in to_remove:
                res.next = ListNode(it.val)
                res = res.next
            it = it.next
        return result_ref.next
