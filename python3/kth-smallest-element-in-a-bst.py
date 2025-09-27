# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        def left_root_right(node):
            if node is None:
                return
            yield from left_root_right(node.left)
            yield node
            yield from left_root_right(node.right)

        for i, node in enumerate(left_root_right(root), start=1):
            if i == k:
                return node.val
        return -1
