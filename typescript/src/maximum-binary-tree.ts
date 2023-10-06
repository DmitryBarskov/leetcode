/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */
class TreeNode {
  val: number
  left: TreeNode | null
  right: TreeNode | null
  constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
      this.val = (val===undefined ? 0 : val)
      this.left = (left===undefined ? null : left)
      this.right = (right===undefined ? null : right)
  }
}

function findMax(nums: number[], { from = 0, to = nums.length }): { maxValue: number, maxIndex: number } {
  let maxValue = null;
  let maxIndex = null;

  for (let i = from; i < to; i++) {
    if (maxValue === null || nums[i] > maxValue) {
      maxValue = nums[i];
      maxIndex = i;
    }
  }

  return { maxValue: maxValue!!, maxIndex: maxIndex!! };
}

export function constructMaximumBinaryTree(nums: number[], { from = 0, to = nums.length } = {}): TreeNode | null {
  if (to === from) {
    return null;
  }
  if (to - from === 1) {
    return new TreeNode(nums[from]);
  }

  let { maxValue, maxIndex } = findMax(nums, { from, to });
  return new TreeNode(
    maxValue,
    constructMaximumBinaryTree(nums, { from, to: maxIndex }),
    constructMaximumBinaryTree(nums, { from: maxIndex + 1, to })
  );
}
