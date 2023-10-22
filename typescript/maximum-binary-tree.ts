import TreeNode from "./func/TreeNode.ts";

// https://leetcode.com/problems/maximum-binary-tree/description/

function findMax(nums: number[], { from = 0, to = nums.length }): { maxValue: number, maxIndex: number } {
  let maxValue: number | null = null;
  let maxIndex: number | null = null;

  for (let i = from; i < to; i++) {
    if (maxValue === null || nums[i] > maxValue) {
      maxValue = nums[i];
      maxIndex = i;
    }
  }

  return { maxValue: maxValue!, maxIndex: maxIndex! };
}

export function constructMaximumBinaryTree(nums: number[], { from = 0, to = nums.length } = {}): TreeNode | null {
  if (to === from) {
    return null;
  }
  if (to - from === 1) {
    return new TreeNode(nums[from]);
  }

  const { maxValue, maxIndex } = findMax(nums, { from, to });
  return new TreeNode(
    maxValue,
    constructMaximumBinaryTree(nums, { from, to: maxIndex }),
    constructMaximumBinaryTree(nums, { from: maxIndex + 1, to })
  );
}
