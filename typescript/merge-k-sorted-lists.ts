// https://leetcode.com/problems/merge-k-sorted-lists/

/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

function mergeKLists(lists: Array<ListNode | null>): ListNode | null {
  const iters = [...lists.filter(x => x !== null) as Array<ListNode>];

  const newListRef = new ListNode(0);
  let mergedIter = newListRef;

  while (iters.length > 0) {
    let min = iters[0].val;
    let minIndex = 0;
    for (let i = 1; i < iters.length; i++) {
      if (iters[i].val < min) {
        min = iters[i].val;
        minIndex = i;
      }
    }

    mergedIter.next = new ListNode(min);
    mergedIter = mergedIter.next;

    if (iters[minIndex].next === null) {
      iters[minIndex] = iters[iters.length - 1];
      iters.pop();
    } else {
      iters[minIndex] = iters[minIndex].next!;
    }
  }

  return newListRef.next;
}

import ListNode, { arrayFromListNode, listNodeFromArray } from "./func/ListNode.ts";
import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(
    arrayFromListNode(
      mergeKLists(
        [[1, 4, 5], [1, 3, 4], [2, 6]].map(listNodeFromArray),
      ),
    ),
    [1, 1, 2, 3, 4, 4, 5, 6],
  );
});
