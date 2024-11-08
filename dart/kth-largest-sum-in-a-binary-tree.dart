import 'package:collection/collection.dart';

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class Solution {
  int kthLargestLevelSum(TreeNode? root, int k) {
    var heap = HeapPriorityQueue<int>();

    levelSums(root, (int levelSum) {
      print(levelSum);
      heap.add(levelSum);
      while (heap.length > k) {
        heap.removeFirst();
      }
    });

    return heap.length >= k ? heap.first : -1;
  }

  void levelSums(TreeNode? root, void Function(int) callback) {
    if (root == null) { return; }
    var queue = QueueList<(TreeNode, int)>();
    queue.add((root, 0));
    int previousLevel = 0;
    int previousLevelSum = 0;
    while (queue.isNotEmpty) {
      var (next, level) = queue.removeFirst();
      
      if (level != previousLevel) {
        callback(previousLevelSum);
        previousLevelSum = next.val;
      } else {
        previousLevelSum += next.val;
      }
      if (next.right != null) {
        queue.add((next.right!, level + 1));
      }
      if (next.left != null) {
        queue.add((next.left!, level + 1));
      }
      previousLevel = level;
    }
    callback(previousLevelSum);
  }
}
