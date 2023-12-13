// @leetup=custom
// @leetup=info id=94 lang=java slug=binary-tree-inorder-traversal

/*
* Given the `root` of a binary tree, return *the inorder traversal of its nodes'
* values*.
* 
* 
* Example 1:
* 
* Input: root = [1,null,2,3]
* Output: [1,3,2]
* 
* Example 2:
* 
* Input: root = []
* Output: []
* 
* Example 3:
* 
* Input: root = [1]
* Output: [1]
* 
* 
* Constraints:
* 
* * The number of nodes in the tree is in the range `[0, 100]`.
* * `-100 <= Node.val <= 100`
* 
* 
* Follow up: Recursive solution is trivial, could you do it iteratively?
* 
*/
import java.util.AbstractMap.SimpleImmutableEntry;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;
import java.util.Map.Entry;

public class Main {
    public static void main(String[] args) {
        System.out.println(
            new Solution().inorderTraversal(
                TreeNode.fromArray(new Integer[] {1, 2, 3, 4, 5, null, 6})
            )
        );
        System.out.println("Exected: 4 2 5 1 3 6");
    }
}
// @leetup=custom
// @leetup=code
class Solution {
    public static List<Integer> inorderTraversal(TreeNode root) {
        Deque<Entry<TreeNode, Boolean>> stack = new ArrayDeque<>();
        stack.push(new SimpleImmutableEntry<>(root, false));

        List<Integer> traversal = new ArrayList<>();

        while (!stack.isEmpty()) {
            Entry<TreeNode, Boolean> pair = stack.pop();
            TreeNode currentNode = pair.getKey();
            boolean visited = pair.getValue();

            if (currentNode == null) {
                continue;
            }

            if (visited) {
                traversal.add(currentNode.val);
            } else {
                stack.push(new SimpleImmutableEntry<>(currentNode.right, false));
                stack.push(new SimpleImmutableEntry<>(currentNode, true));
                stack.push(new SimpleImmutableEntry<>(currentNode.left, false));
            }
        }

        return traversal;
    }
}
// @leetup=code
