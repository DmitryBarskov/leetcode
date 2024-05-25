import TreeNode from './func/TreeNode';

function findTarget(root: TreeNode | null, target: number): boolean {
  const i = leftToRight(root);
  const j = rightToLeft(root);

  let treeI = i.next();
  let treeJ = j.next();
  while (!treeI.done && !treeJ.done && treeI.value < treeJ.value) {
    let sum = treeI.value + treeJ.value;
    if (sum > target) {
      treeJ = j.next();
    } else if (sum < target) {
      treeI = i.next();
    } else {
      return true;
    }
  }

  return false;
}

function* leftToRight(root: TreeNode | null): Generator<number, void, void> {
  if (root == null) { return; }

  const leftSubtree = leftToRight(root.left);
  for (const leftVal of leftSubtree) {
    yield leftVal;
  }
  yield root.val;
  const rightSubtree = leftToRight(root.right);
  for (const rightVal of rightSubtree) {
    yield rightVal;
  }
}

function* rightToLeft(root: TreeNode | null): Generator<number, void, void> {
  if (root == null) { return; }

  const rightSubtree = rightToLeft(root.right);
  for (const rightVal of rightSubtree) {
    yield rightVal;
  }
  yield root.val;
  const leftSubtree = rightToLeft(root.left);
  for (const leftVal of leftSubtree) {
    yield leftVal;
  }
}

import { test, expect } from "bun:test";

test("examples", () => {
  expect(findTarget(TreeNode.fromArray([5, 3, 6, 2, 4, null, 7]), 9)).toEqual(true);
  expect(findTarget(TreeNode.fromArray([5, 3, 6, 2, 4, null, 7]), 28)).toEqual(false);
});
