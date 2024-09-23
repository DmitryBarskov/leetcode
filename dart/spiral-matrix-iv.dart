/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  List<List<int>> spiralMatrix(int m, int n, ListNode? head) {
    var matrix = List<List<int>>.generate(
      m, (int i) => List<int>.filled(n, -1)
    );
    int top = 0, bottom = m - 1, left = 0, right = n - 1;
    ListNode? iter = head!;
    while (iter != null && left <= right && top <= bottom) {
      for (int i = left; i <= right && iter != null; i++) {
        matrix[top][i] = iter!.val;
        iter = iter!.next;
      }
      top++;
      for (int i = top; i <= bottom && iter != null; i++) {
        matrix[i][right] = iter.val;
        iter = iter!.next;
      }
      right--;
      if (left > right || top > bottom) {
        break;
      }
      for (int i = right; i >= left && iter != null; i--) {
        matrix[bottom][i] = iter!.val;
        iter = iter!.next;
      }
      bottom--;
      for (int i = bottom; i >= top && iter != null; i--) {
        matrix[i][left] = iter!.val;
        iter = iter!.next;
      }
      left++;
    }
    return matrix;
  }
}