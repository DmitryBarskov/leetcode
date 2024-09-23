/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  List<ListNode?> splitListToParts(ListNode? head, int k) {
    int len = length(head);
    int shortPartLength = len ~/ k;
    int longParts = len % k;
    ListNode? iter = head;
    return List<ListNode?>.generate(k, (int i) {
      int partLength = i < longParts ? shortPartLength + 1: shortPartLength;
      ListNode ref = ListNode(0, null);
      ListNode? last = ref;
      for (int j = 0; j < partLength; j++) {
        last!.next = ListNode(iter?.val ?? 0, null);
        last = last?.next;
        iter = iter?.next;
      }
      return ref.next;
    });
  }

  int length(ListNode? list) {
    int len = 0;
    while (list != null) {
      list = list.next;
      len++;
    }
    return len;
  }
}