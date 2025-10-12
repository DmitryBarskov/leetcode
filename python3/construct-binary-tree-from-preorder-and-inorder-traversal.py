from typing import List, Optional


# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def buildTree(self, preorder: List[int], inorder: List[int]) -> Optional["TreeNode"]:
        def recur(pre, ino):
            if len(pre) == 0:
                return None

            left_end = ino.index(pre[0])

            return TreeNode(
                pre[0],
                recur(pre[1:left_end + 1], ino[:left_end]),
                recur(pre[left_end + 1:], ino[left_end + 1:])
            )
        return recur(preorder, inorder)
