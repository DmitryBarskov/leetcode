// @leetup=custom
// @leetup=info id=199 lang=scala slug=binary-tree-right-side-view

/*
* Given the `root` of a binary tree, imagine yourself standing on the right
* side of it, return *the values of the nodes you can see ordered from top to
* bottom*.
* 
* 
* Example 1:
* 
* Input: root = [1,2,3,null,5,null,4]
* Output: [1,3,4]
* 
* Example 2:
* 
* Input: root = [1,null,3]
* Output: [1,3]
* 
* Example 3:
* 
* Input: root = []
* Output: []
* 
* 
* Constraints:
* 
* * The number of nodes in the tree is in the range `[0, 100]`.
* * `-100 <= Node.val <= 100`
* 
*/

import func.TreeNode

object Main {
    def main(args: Array[String]): Unit = {
        Solution.rightSideView(TreeNode.from(1, 2, 3)) match {
            case List(1, 3) => "ok"
            case _ => throw new AssertionError()
        }
        Solution.rightSideView(TreeNode.from(1, 2, null, 4)) match {
            case List(1, 2, 4) => "ok"
            case _ => throw new AssertionError()
        }
        Solution.rightSideView(TreeNode.from(1,2,3,null,5,null,4)) match {
            case List(1, 3, 4) => "ok"
            case _ => assert(false)
        }
        Solution.rightSideView(TreeNode.from(1,null,3)) match {
            case List(1, 3) => "ok"
            case _ => assert(false)
        }
        Solution.rightSideView(TreeNode.from()) match {
            case List() => ""
            case _ => assert(false)
        }
    }
}

// @leetup=custom
// @leetup=code
import java.util

/**
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def rightSideView(root: TreeNode): List[Int] = {
        if (root == null) {
            return List()
        }
        val asList = scala.collection.mutable.ArrayBuffer.empty[Int]
        val queue: util.LinkedList[(TreeNode, Int)] = new util.LinkedList[(TreeNode, Int)]
        queue.add((root, 0))
        while (!queue.isEmpty) {
            val (node, level) = queue.pollFirst()
            while (asList.size <= level) {
                asList.append(node.value)
            }
            asList(level) = node.value

            if (node.left != null) {
                queue.add((node.left, level + 1))
            }
            if (node.right != null) {
                queue.add((node.right, level + 1))
            }
        }
        asList.toList
    }
}
// @leetup=code
