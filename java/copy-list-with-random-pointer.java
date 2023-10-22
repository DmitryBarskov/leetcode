import java.util.*;
import java.util.function.*;

// https://leetcode.com/problems/copy-list-with-random-pointer/
public class Solution {
  public static class Node {
    int val;
    Node next;
    Node random;

    public Node(int val) {
      this.val = val;
      this.next = null;
      this.random = null;
    }
  }

  static BiFunction<Node, Node, Node> findOrBuild = (original, clone) ->
    (clone != null) ? clone : new Node(original.val);

  public Node copyRandomList(Node head) {
    if (head == null) { return null; }

    Map<Node, Node> copies = new HashMap<>();

    Node copy = new Node(head.val);
    copies.put(head, copy);

    Node listIter = head.next;
    Node copyIter = copy;

    while (listIter != null) {
      copyIter.next = copies.compute(listIter, findOrBuild);
      if (listIter.random != null) {
        copyIter.next.random = copies.compute(listIter.random, findOrBuild);
      }
      listIter = listIter.next;
      copyIter = copyIter.next;
    }

    return copy;
  }
}
