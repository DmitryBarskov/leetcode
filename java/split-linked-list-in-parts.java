/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */

class Solution {
  static class ListNode {
    int val;
    ListNode next;
    ListNode() {}
    ListNode(int val) { this.val = val; }
    ListNode(int val, ListNode next) { this.val = val; this.next = next; }
  }
  public static void main(String[] args) {
    new Solution().splitListToParts(new ListNode(1, new ListNode(2, new ListNode(3))), 5);
  }
  public ListNode[] splitListToParts(ListNode head, int k) {
    int partSize = (int) Math.ceil(listLength(head) / ((double) k));
    System.out.printf("k: %d, partSize: %d\n", k, partSize);

    ListNode[] parts = new ListNode[k];
    
    ListNode iter = head;
    int currentPart = 0;
    while (iter != null) {
      ListNode lastItem = new ListNode(iter.val);
      parts[currentPart] = lastItem;
      iter = iter.next;
      for (int i = 1; i < partSize && iter != null; i++) {
        lastItem.next = new ListNode(iter.val);
        lastItem = lastItem.next;
        iter = iter.next;
      }
      currentPart++;
    }

    return parts;
  }

  static int listLength(ListNode head) {
    ListNode iter = head;
    int length = 0;
    while (iter != null) {
      length++;
      iter = iter.next;
    }
    return length;
  }
}
