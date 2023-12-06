// @leetup=custom
// @leetup=info id=935 lang=typescript slug=knight-dialer

/*
 * The chess knight has a unique movement, it may move two squares vertically
 * and one square horizontally, or two squares horizontally and one square
 * vertically (with both forming the shape of an L). The possible movements of
 * chess knight are shown in this diagaram:
 *
 * A chess knight can move as indicated in the chess diagram below:
 *
 * We have a chess knight and a phone pad as shown below, the knight can only
 * stand on a numeric cell (i.e. blue cell).
 *
 * Given an integer `n`, return how many distinct phone numbers of length `n` we
 * can dial.
 *
 * You are allowed to place the knight on any numeric cell initially and then
 * you should perform `n - 1` jumps to dial a number of length `n`. All jumps
 * should be valid knight jumps.
 *
 * As the answer may be very large, return the answer modulo `109 + 7`.
 *
 * Example 1:
 *
 * Input: n = 1
 * Output: 10
 * Explanation: We need to dial a number of length 1, so placing the knight ove
 * r any numeric cell of the 10 cells is sufficient.
 *
 * Example 2:
 *
 * Input: n = 2
 * Output: 20
 * Explanation: All the valid number we can dial are [04, 06, 16, 18, 27, 29, 3
 * 4, 38, 40, 43, 49, 60, 61, 67, 72, 76, 81, 83, 92, 94]
 *
 * Example 3:
 *
 * Input: n = 3131
 * Output: 136006598
 * Explanation: Please take care of the mod.
 *
 * Constraints:
 *
 * * `1 <= n <= 5000`
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("example 1", () => {
  assertEquals(knightDialer(1), 10);
});

Deno.test("example 2", () => {
  assertEquals(knightDialer(2), 20);
});

Deno.test("example 3", () => {
  assertEquals(knightDialer(3131), 136006598);
});

Deno.test("more examples", () => {
  assertEquals(
    [2, 3, 4, 5, 6, 7, 8, 9, 10, 11].map(knightDialer),
    [20, 46, 104, 240, 544, 1256, 2848, 6576, 14912, 34432],
  );
});
// @leetup=custom
// @leetup=code
const MOD = 1_000_000_007;
const sum = (...nums: number[]): number => nums.reduce((a, b) => (a + b) % MOD, 0);

function knightDialer(n: number): number {
  const endWith = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
  for (let i = 1; i < n; i++) {
    const [end0, end1, end2, end3, end4, _, end6, end7, end8, end9] = endWith;
    endWith[0] = sum(end4, end6);
    endWith[1] = sum(end6, end8);
    endWith[2] = sum(end7, end9);
    endWith[3] = sum(end4, end8);
    endWith[4] = sum(end3, end9, end0);
    endWith[5] = 0;
    endWith[6] = sum(end1, end7, end0);
    endWith[7] = sum(end2, end6);
    endWith[8] = sum(end1, end3);
    endWith[9] = sum(end2, end4);
  }
  return sum(...endWith);
}
// @leetup=code
