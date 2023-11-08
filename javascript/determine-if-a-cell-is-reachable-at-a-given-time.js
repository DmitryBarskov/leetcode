// @leetup=custom
// @leetup=info id=2849 lang=javascript slug=determine-if-a-cell-is-reachable-at-a-given-time

/*
 * You are given four integers `sx`, `sy`, `fx`, `fy`, and a non-negative
 * integer `t`.
 *
 * In an infinite 2D grid, you start at the cell `(sx, sy)`. Each second, you
 * must move to any of its adjacent cells.
 *
 * Return `true` *if you can reach cell *`(fx, fy)` *after exactly* `t`
 * *seconds*, *or* `false` *otherwise*.
 *
 * A cell's adjacent cells are the 8 cells around it that share at least one
 * corner with it. You can visit the same cell several times.
 *
 * Example 1:
 *
 * Input: sx = 2, sy = 4, fx = 7, fy = 7, t = 6
 * Output: true
 * Explanation: Starting at cell (2, 4), we can reach cell (7, 7) in exactly 6
 * seconds by going through the cells depicted in the picture above.
 *
 * Example 2:
 *
 * Input: sx = 3, sy = 1, fx = 7, fy = 3, t = 3
 * Output: false
 * Explanation: Starting at cell (3, 1), it takes at least 4 seconds to reach c
 * ell (7, 3) by going through the cells depicted in the picture above. Hence, we c
 * annot reach cell (7, 3) at the third second.
 *
 * Constraints:
 *
 * * `1 <= sx, sy, fx, fy <= 109`
 * * `0 <= t <= 109`
 */

import { assertEquals } from "std/assert/mod.ts";

Deno.test("example 1", () => {
  assertEquals(isReachableAtTime(2, 4, 7, 7, 6), true);
});

Deno.test("example 2", () => {
  assertEquals(isReachableAtTime(3, 1, 7, 3, 3), false);
});

Deno.test("example 3", () => {
  // starting at 0, go to 1, then go to 3, then go to 0
  // 1 2
  // 0 x
  assertEquals(isReachableAtTime(1, 1, 1, 1, 3), true);
});

Deno.test("must move", () => {
  assertEquals(isReachableAtTime(1, 2, 1, 2, 1), false);
});

// @leetup=custom
// @leetup=code
function isReachableAtTime(sx, sy, fx, fy, t) {
  if (sx === fx && sy === fy && t === 1) {
    return false
  }
  return Math.max(Math.abs(sx - fx), Math.abs(sy - fy)) <= t;
}
// @leetup=code
