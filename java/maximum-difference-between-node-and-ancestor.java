// @leetup=custom
// @leetup=info id=1026 lang=java slug=maximum-difference-between-node-and-ancestor

/*
* Given the `root` of a binary tree, find the maximum value `v` for which there
* exist different nodes `a` and `b` where `v = |a.val - b.val|` and `a` is an
* ancestor of `b`.
* 
* A node `a` is an ancestor of `b` if either: any child of `a` is equal to `b` or
* any child of `a` is an ancestor of `b`.
* 
* Example 1:
* Input: root = [8,3,10,1,6,null,14,null,null,4,7,13]
* Output: 7
* Explanation: We have various ancestor-node differences, some of which are gi
* ven below :
* |8 - 3| = 5
* |3 - 7| = 4
* |8 - 1| = 7
* |10 - 13| = 3
* Among all possible differences, the maximum value of 7 is obtained by |8 - 1| = 
* 7.
* 
* Example 2:
* Input: root = [1,null,2,null,0,3]
* Output: 3
* 
* Constraints:
* * The number of nodes in the tree is in the range `[2, 5000]`.
* * `0 <= Node.val <= 105`
*/
import java.util.*;

public class Main {
    public static void main(String[] args) {
        System.out.println(new Solution().maxAncestorDiff(TreeNode.fromArray(new Integer[]{8,3,10,1,6,null,14,null,null,4,7,13})));
        System.out.println(new Solution().maxAncestorDiff(TreeNode.fromArray(new Integer[]{1,null,2,null,0,3})));
        System.out.println(new Solution().maxAncestorDiff(TreeNode.fromArray(new Integer[]{8,3,null,1,6,null,null,4,7})));
        System.out.println(new Solution().maxAncestorDiff(TreeNode.fromArray(new Integer[]{3,1,6,null,null,4,7})));
    }
}
// @leetup=custom
// @leetup=code

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 * }
 */
class Solution {
    public static int maxAncestorDiff(TreeNode root) {
        return recur(root, root.val, root.val);
    }

    static int recur(TreeNode current, int min, int max) {
        if (current == null) {
            return max - min;
        }

        return Math.max(
            recur(current.left, Math.min(min, current.val), Math.max(max, current.val)),
            recur(current.right, Math.min(min, current.val), Math.max(max, current.val))
        );
    }
}
// @leetup=code
