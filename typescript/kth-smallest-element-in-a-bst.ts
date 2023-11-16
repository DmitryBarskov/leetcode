// @leetup=custom
// @leetup=info id=230 lang=typescript slug=kth-smallest-element-in-a-bst

/*
 * Given the `root` of a binary search tree, and an integer `k`, return *the* `kth`
 * *smallest value (1-indexed) of all the values of the nodes in the tree*.
 *
 * Example 1:
 *
 * Input: root = [3,1,4,null,2], k = 1
 * Output: 1
 *
 * Example 2:
 *
 * Input: root = [5,3,6,2,4,null,null,1], k = 3
 * Output: 3
 *
 * Constraints:
 *
 * * The number of nodes in the tree is `n`.
 * * `1 <= k <= n <= 104`
 * * `0 <= Node.val <= 104`
 *
 * Follow up: If the BST is modified often (i.e., we can do insert and delete
 * operations) and you need to find the kth smallest frequently, how would you
 * optimize?
 */

import TreeNode from "./func/TreeNode.ts";
import { assertEquals } from "std/assert/mod.ts";

Deno.test("exmaple 1", () => {
  const tree = TreeNode.fromArray([3, 1, 4, null, 2]);
  assertEquals(kthSmallest(tree, 1), 1);
});

Deno.test("exmaple 2", () => {
  const tree = TreeNode.fromArray([5, 3, 6, 2, 4, null, null, 1]);
  assertEquals(kthSmallest(tree, 3), 3);
  assertEquals(kthSmallest(tree, 4), 4);
});
// @leetup=custom
// @leetup=code

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

type Tree = TreeNode | null;
type TreeCallback = (n: TreeNode) => boolean;

function kthSmallest(root: Tree, k: number): number {
  let kthNode: Tree = null;
  let index = 0;
  leftRootRightTraverse(root, (node: TreeNode): boolean => {
    index += 1;
    kthNode = node;
    return index < k;
  });
  return kthNode!.val ?? -1;
}

function leftRootRightTraverse(root: Tree, callback: TreeCallback): boolean {
  if (root === null) { return true; }

  let continueIteration = leftRootRightTraverse(root.left, callback);
  if (!continueIteration) { return false; }

  continueIteration &&= callback(root);
  if (!continueIteration) { return false; }

  return leftRootRightTraverse(root.right, callback);
}
// @leetup=code
