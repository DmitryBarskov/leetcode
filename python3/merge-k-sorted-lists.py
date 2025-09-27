import heapq


# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        result = ListNode()
        it = result

        heap = []
        iters = [l for l in lists if l is not None]
        for i, l in enumerate(iters):
            heapq.heappush(heap, (l.val, i))

        while len(heap) > 0:
            val, i = heapq.heappop(heap)

            it.next = ListNode(val)
            it = it.next

            iters[i] = iters[i].next
            if iters[i] is not None:
                heapq.heappush(heap, (iters[i].val, i))

        return result.next
