// https://leetcode.com/problems/binary-tree-level-order-traversal/

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

const traverse = (
  root: TreeNode | null,
  callback: (n: TreeNode, level: number) => void,
) => {
  if (root == null) {
    return;
  }

  const queue = new Array<[TreeNode, number]>();
  queue.push([root, 0]);

  while (queue.length > 0) {
    const [node, level] = queue.shift()!;

    callback(node, level);
    if (node.left != null) {
      queue.push([node.left, level + 1]);
    }

    if (node.right != null) {
      queue.push([node.right, level + 1]);
    }
  }
};

function levelOrder(root: TreeNode | null): number[][] {
  const array = new Array<Array<number>>();
  traverse(root, (node, level) => {
    array[level] ??= new Array<number>();
    array[level].push(node.val);
  });
  return array;
}

import { assertEquals } from "std/assert/assert_equals.ts";
import TreeNode from "./func/TreeNode.ts";

Deno.test("a tree", () => {
  // [3,9,20,null,null,15,7]
  const tree = new TreeNode(
    3,
    new TreeNode(9),
    new TreeNode(
      20,
      new TreeNode(15),
      new TreeNode(7),
    ),
  );
  assertEquals(levelOrder(tree), [[3], [9, 20], [15, 7]]);
});

Deno.test("single", () => {
  assertEquals(levelOrder(new TreeNode(1)), [[1]]);
});

Deno.test("empty", () => {
  assertEquals(levelOrder(null), []);
});
