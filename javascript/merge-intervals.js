// @leetup=custom
// @leetup=info id=56 lang=javascript slug=merge-intervals

/*
 * Given an array of `intervals` where `intervals[i] = [starti, endi]`, merge all
 * overlapping intervals, and return *an array of the non-overlapping intervals
 * that cover all the intervals in the input*.
 *
 * Example 1:
 *
 * Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
 * Output: [[1,6],[8,10],[15,18]]
 * Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
 *
 * Example 2:
 *
 * Input: intervals = [[1,4],[4,5]]
 * Output: [[1,5]]
 * Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 *
 * Constraints:
 *
 * * `1 <= intervals.length <= 104`
 * * `intervals[i].length == 2`
 * * `0 <= starti <= endi <= 104`
 */

import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(
    merge([[1, 3], [2, 6], [8, 10], [15, 18]]),
    [[1, 6], [8, 10], [15, 18]],
  );
  assertEquals(merge([[1, 4], [4, 5]]), [[1, 5]]);
});

// @leetup=custom
// @leetup=code

/**
 * @param {number[][]} intervals
 * @return {number[][]}
 */
function merge(intervals) {
  intervals.sort(([s1], [s2]) => s1 - s2);
  const merged = [[...intervals[0]]];

  for (let i = 0; i < intervals.length; i++) {
    let [start, end] = intervals[i];

    if (start <= merged.at(-1)[1]) {
      merged.at(-1)[1] = Math.max(merged.at(-1)[1], end);
    } else {
      merged.push([start, end]);
    }
  }

  return merged;
}
// @leetup=code
