import TreeNode from './func/TreeNode.ts';

// https://leetcode.com/problems/balanced-binary-tree/description/

function depth(tree: TreeNode | null): number {
  if (tree === null) {
    return 0;
  }

  return Math.max(depth(tree.left), depth(tree.right)) + 1;
}

function isBalanced(root: TreeNode | null): boolean {
  if (root === null) { return true; }

  return Math.abs(depth(root.left) - depth(root.right)) <= 1;
}
