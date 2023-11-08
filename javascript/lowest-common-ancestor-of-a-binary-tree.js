// @leetup=custom
// @leetup=info id=236 lang=javascript slug=lowest-common-ancestor-of-a-binary-tree

/*
 * Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in
 * the tree.
 *
 * According to the [definition of LCA on Wikipedia][1]: “The lowest common
 * ancestor is defined between two nodes `p` and `q` as the lowest node in `T` that
 * has both `p` and `q` as descendants (where we allow a node to be a descendant of
 * itself).”
 *
 * Example 1:
 *
 * Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 * Output: 3
 * Explanation: The LCA of nodes 5 and 1 is 3.
 *
 * Example 2:
 *
 * Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 * Output: 5
 * Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant
 *  of itself according to the LCA definition.
 *
 * Example 3:
 *
 * Input: root = [1,2], p = 1, q = 2
 * Output: 1
 *
 * Constraints:
 *
 * * The number of nodes in the tree is in the range `[2, 105]`.
 * * `-109 <= Node.val <= 109`
 * * All `Node.val` are unique.
 * * `p != q`
 * * `p` and `q` will exist in the tree.
 *
 * [1]: https://en.wikipedia.org/wiki/Lowest_common_ancestor
 */

import { assertEquals } from "std/assert/mod.ts";

import TreeNode from "../typescript/func/TreeNode.ts";

Deno.test("example 1 & 2", () => {
  /*        3
   *      /  \
   *     5     1
   *    / \   / \
   *   6   2 0   8
   *      / \
   *     7   4
   */
  const four = new TreeNode(4);
  const five = new TreeNode(
    5,
    new TreeNode(6),
    new TreeNode(2, new TreeNode(7), four),
  );
  const one = new TreeNode(
    1,
    new TreeNode(0),
    new TreeNode(8),
  );
  const root = new TreeNode(3, five, one);
  assertEquals(lowestCommonAncestor(root, five, one), root);
  assertEquals(lowestCommonAncestor(root, five, four), five);
});

Deno.test("example 1 & 2", () => {
  const two = new TreeNode(2);
  const root = new TreeNode(1, two);
  assertEquals(lowestCommonAncestor(root, root, two), root);
});
// @leetup=custom
// @leetup=code

/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @param {TreeNode} p
 * @param {TreeNode} q
 * @return {TreeNode}
 */
function lowestCommonAncestor(root, p, q) {
  const pPath = findPath(root, p);
  const qPath = findPath(root, q);
  const shortrestPath = Math.min(pPath.length, qPath.length);

  for (let i = shortrestPath - 1; i >= 0; i--) {
    if (qPath[i] === pPath[i]) {
      return qPath[i];
    }
  }
  return root;
}

function findPath(tree, node) {
  if (!tree) {
    return null;
  }
  if (tree === node) {
    return [tree];
  }
  const pathInLeftSubtree = tree.left && findPath(tree.left, node);
  if (pathInLeftSubtree) {
    return [tree, ...pathInLeftSubtree];
  }
  const pathInRightSubtree = tree.right && findPath(tree.right, node);
  if (pathInRightSubtree) {
    return [tree, ...pathInRightSubtree];
  }
  return null;
}
// @leetup=code
