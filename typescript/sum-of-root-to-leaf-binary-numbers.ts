class TreeNode {
  val: number
  left: TreeNode | null
  right: TreeNode | null

  constructor(val: number = 0, left: TreeNode | null = null, right: TreeNode | null = null) {
      this.val = val;
      this.left = left;
      this.right = right;
  }
}

// https://leetcode.com/problems/sum-of-root-to-leaf-binary-numbers/

function sumRootToLeaf(root: TreeNode | null): number {
  let sum = 0;

  const collectNumbers = (currentNode: TreeNode | null, acc: number) => {
    if (currentNode === null) {
      return;
    }
    if (currentNode.left === null && currentNode.right === null) {
      sum += acc * 2 + currentNode.val;
      return;
    }
    collectNumbers(currentNode.left, acc * 2 + currentNode.val);
    collectNumbers(currentNode.right, acc * 2 + currentNode.val);
  };

  collectNumbers(root, 0);

  return sum;
}
