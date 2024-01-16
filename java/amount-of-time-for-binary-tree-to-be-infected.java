// @leetup=custom
// @leetup=info id=2385 lang=java slug=amount-of-time-for-binary-tree-to-be-infected

/*
* You are given the `root` of a binary tree with unique values, and an integer
* `start`. At minute `0`, an infection starts from the node with value
* `start`.
* 
* Each minute, a node becomes infected if:
* 
* * The node is currently uninfected.
* * The node is adjacent to an infected node.
* 
* Return *the number of minutes needed for the entire tree to be infected.*
* 
* Example 1:
* Input: root = [1,5,3,null,4,10,6,9,2], start = 3
* Output: 4
* Explanation: The following nodes are infected during:
* - Minute 0: Node 3
* - Minute 1: Nodes 1, 10 and 6
* - Minute 2: Node 5
* - Minute 3: Node 4
* - Minute 4: Nodes 9 and 2
* It takes 4 minutes for the whole tree to be infected so we return 4.
* 
* Example 2:
* Input: root = [1], start = 1
* Output: 0
* Explanation: At minute 0, the only node in the tree is infected so we return
*  0.
* 
* Constraints:
* * The number of nodes in the tree is in the range `[1, 105]`.
* * `1 <= Node.val <= 105`
* * Each node has a unique value.
* * A node with a value of `start` exists in the tree.
*/
import java.util.*;

public class Main {
    public static void main(String[] args) {
        System.out.println(new Solution().amountOfTime(TreeNode.fromArray(new Integer[]{1,5,3,null,4,10,6,9,2}), 3));
        System.out.println(new Solution().amountOfTime(TreeNode.fromArray(new Integer[]{1}), 1));
    }
}
// @leetup=custom
// @leetup=code

class Solution {
    public static int amountOfTime(TreeNode root, int start) {
        return recur(root, start).startMaxDist();
    }

    static record TreeInfo(Integer height, Integer startDepth, Integer startMaxDist) {}

    static TreeInfo recur(TreeNode current, int start) {
        if (current == null) {
            return new TreeInfo(0, null, null);
        }
        TreeInfo left = recur(current.left, start);
        TreeInfo right = recur(current.right, start);
        if (current.val == start) {
            int maxStartDist = Math.max(left.height(), right.height());
            return new TreeInfo(maxStartDist + 1, 0, maxStartDist);
        }
        if (left.startDepth() != null) {
            return new TreeInfo(
                Math.max(left.height(), right.height()) + 1,
                left.startDepth() + 1,
                Math.max(right.height() + left.startDepth() + 1, left.startMaxDist())
            );
        }
        if (right.startDepth() != null) {
            return new TreeInfo(
                Math.max(left.height(), right.height()) + 1,
                right.startDepth() + 1,
                Math.max(left.height() + right.startDepth() + 1, right.startMaxDist())
            );
        }
        return new TreeInfo(Math.max(left.height(), right.height()) + 1, null, null);
    }
}
// @leetup=code
