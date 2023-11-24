// @leetup=custom
// @leetup=info id=1561 lang=typescript slug=maximum-number-of-coins-you-can-get

/*
 * There are `3n` piles of coins of varying size, you and your friends will take
 * piles of coins as follows:
 *
 * * In each step, you will choose any `3` piles of coins (not necessarily
 *   consecutive).
 * * Of your choice, Alice will pick the pile with the maximum number of coins.
 * * You will pick the next pile with the maximum number of coins.
 * * Your friend Bob will pick the last pile.
 * * Repeat until there are no more piles of coins.
 *
 * Given an array of integers `piles` where `piles[i]` is the number of coins in
 * the `ith` pile.
 *
 * Return the maximum number of coins that you can have.
 *
 * Example 1:
 *
 * Input: piles = [2,4,1,2,7,8]
 * Output: 9
 * Explanation: Choose the triplet (2, 7, 8), Alice Pick the pile with 8 coins,
 *  you the pile with 7 coins and Bob the last one.
 * Choose the triplet (1, 2, 4), Alice Pick the pile with 4 coins, you the pile wit
 * h 2 coins and Bob the last one.
 * The maximum number of coins which you can have are: 7 + 2 = 9.
 * On the other hand if we choose this arrangement (1, 2, 8), (2, 4, 7) you
 *  only get 2 + 4 = 6 coins which is not optimal.
 *
 * Example 2:
 *
 * Input: piles = [2,4,5]
 * Output: 4
 *
 * Example 3:
 *
 * Input: piles = [9,8,7,6,5,1,2,3,4]
 * Output: 18
 *
 * Constraints:
 *
 * * `3 <= piles.length <= 10^5`
 * * `piles.length % 3 == 0`
 * * `1 <= piles[i] <= 10^4`
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("quickSort", () => {
  const array = [9, 8, 7, 10, 11, 6, 5, 1, 2, 3, 4];
  quickSort(array);
  assertEquals(array, [11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
});

Deno.test("examples 1", () => {
  assertEquals(maxCoins([2, 4, 1, 2, 7, 8]), 9);
  assertEquals(maxCoins([2, 4, 5]), 4);
  assertEquals(maxCoins([9, 8, 7, 6, 5, 1, 2, 3, 4]), 18);
});

Deno.test("failed", () => {
  assertEquals(maxCoins([2,4,1,2,7,8]), 9);
});
// @leetup=custom
// @leetup=code

function maxCoins(piles: number[]): number {
  piles.sort((a, b) => b - a);
  const pilesEnd = 2 * piles.length / 3;
  let picked = 0;
  for (let i = 1; i < pilesEnd; i += 2) {
    picked += piles[i];
  }
  return picked;
}
// @leetup=code
