// @leetup=custom
// @leetup=info id=235 lang=javascript slug=lowest-common-ancestor-of-a-binary-search-tree

/*
* Given a binary search tree (BST), find the lowest common ancestor (LCA) node of
* two given nodes in the BST.
* 
* According to the [definition of LCA on Wikipedia][1]: “The lowest common
* ancestor is defined between two nodes `p` and `q` as the lowest node in `T` that
* has both `p` and `q` as descendants (where we allow a node to be a descendant
* of itself).”
* 
* 
* Example 1:
*           6
*          / \
*         /   \
*        2     8
*       / \   / \
*      0   4 7   9
*         / \
*        3   5
* Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
* Output: 6
* Explanation: The LCA of nodes 2 and 8 is 6.
* 
* Example 2:
* 
* Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
* Output: 2
* Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant
*  of itself according to the LCA definition.
* 
* Example 3:
* 
* Input: root = [2,1], p = 2, q = 1
* Output: 2
* 
* 
* Constraints:
* 
* * The number of nodes in the tree is in the range `[2, 105]`.
* * `-10^9 <= Node.val <= 10^9`
* * All `Node.val` are unique.
* * `p != q`
* * `p` and `q` will exist in the BST.
* 
* [1]: https://en.wikipedia.org/wiki/Lowest_common_ancestor
* 
*/
// @leetup=custom

import { assertEquals } from "std/assert/mod.ts";

import TreeNode from "../typescript/func/TreeNode.ts";

Deno.test("example 1 & 2", () => {
  const four = new TreeNode(4, new TreeNode(3), new TreeNode(5));
  const two = new TreeNode(2, new TreeNode(0), four);
  const eight = new TreeNode(8, new TreeNode(7), new TreeNode(9));
  const root = new TreeNode(6, two, eight);

  assertEquals(lowestCommonAncestor(root, two, eight), root);
  assertEquals(lowestCommonAncestor(root, two, four), two);
});

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
  if (root === null) return null;
  if (root === p || root === q) return root;

  if (p.val > q.val) {
    [p, q] = [q, p];
  }

  if (p.val < root.val && root.val < q.val) return root;
  
  if (q.val < root.val) return lowestCommonAncestor(root.left, p, q);
  if (root.val < p.val) return lowestCommonAncestor(root.right, p, q);
};
// @leetup=code
