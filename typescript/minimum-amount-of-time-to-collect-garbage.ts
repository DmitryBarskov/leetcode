// @leetup=custom
// @leetup=info id=2391 lang=typescript slug=minimum-amount-of-time-to-collect-garbage

/*
 * You are given a 0-indexed array of strings `garbage` where `garbage[i]`
 * represents the assortment of garbage at the `ith` house. `garbage[i]` consists
 * only of the characters `'M'`, `'P'` and `'G'` representing one unit of metal,
 * paper and glass garbage respectively. Picking up one unit of any type of
 * garbage takes `1` minute.
 *
 * You are also given a 0-indexed integer array `travel` where `travel[i]` is
 * the number of minutes needed to go from house `i` to house `i + 1`.
 *
 * There are three garbage trucks in the city, each responsible for picking up one
 * type of garbage. Each garbage truck starts at house `0` and must visit each
 * house in order; however, they do not need to visit every house.
 *
 * Only one garbage truck may be used at any given moment. While one truck is
 * driving or picking up garbage, the other two trucks cannot do anything.
 *
 * Return* the minimum number of minutes needed to pick up all the garbage.*
 *
 * Example 1:
 *
 * Input: garbage = ["G","P","GP","GG"], travel = [2,4,3]
 * Output: 21
 * Explanation:
 * The paper garbage truck:
 * 1. Travels from house 0 to house 1
 * 2. Collects the paper garbage at house 1
 * 3. Travels from house 1 to house 2
 * 4. Collects the paper garbage at house 2
 * Altogether, it takes 8 minutes to pick up all the paper garbage.
 * The glass garbage truck:
 * 1. Collects the glass garbage at house 0
 * 2. Travels from house 0 to house 1
 * 3. Travels from house 1 to house 2
 * 4. Collects the glass garbage at house 2
 * 5. Travels from house 2 to house 3
 * 6. Collects the glass garbage at house 3
 * Altogether, it takes 13 minutes to pick up all the glass garbage.
 * Since there is no metal garbage, we do not need to consider the metal garbage tr
 * uck.
 * Therefore, it takes a total of 8 + 13 = 21 minutes to collect all the garbage.
 *
 * Example 2:
 *
 * Input: garbage = ["MMM","PGM","GP"], travel = [3,10]
 * Output: 37
 * Explanation:
 * The metal garbage truck takes 7 minutes to pick up all the metal garbage.
 * The paper garbage truck takes 15 minutes to pick up all the paper garbage.
 * The glass garbage truck takes 15 minutes to pick up all the glass garbage.
 * It takes a total of 7 + 15 + 15 = 37 minutes to collect all the garbage.

 * M+P+G=(1+1+1+3+1)+(3+1+10+1)+(3+1+10+1)=37

 * Constraints:
 * * `2 <= garbage.length <= 10^5`
 * * `garbage[i]` consists of only the letters `'M'`, `'P'`, and `'G'`.
 * * `1 <= garbage[i].length <= 10`
 * * `travel.length == garbage.length - 1`
 * * `1 <= travel[i] <= 100`
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("example 1", () => {
  assertEquals(garbageCollection(["G", "P", "GP", "GG"], [2, 4, 3]), 21);
});

Deno.test("example 2", () => {
  assertEquals(garbageCollection(["MMM", "PGM", "GP"], [3, 10]), 37);
});
// @leetup=custom
// @leetup=code

function garbageCollection(garbage: string[], travel: number[]): number {
  const letters = countLetters(garbage);
  const travelTimes = new Array<number>(travel.length + 1);
  travelTimes[0] = 0;
  for (let i = 1; i < travelTimes.length; i++) {
    travelTimes[i] = travelTimes[i - 1] + travel[i - 1];
  }
  return Object.entries(letters).reduce(
    (sum, [_, { count, lastIndex }]) => sum + count + travelTimes[lastIndex],
    0,
  );
}

function countLetters(garbage: string[]) {
  const letters = {
    "G": { count: 0, lastIndex: 0 },
    "P": { count: 0, lastIndex: 0 },
    "M": { count: 0, lastIndex: 0 },
  };
  for (let i = 0; i < garbage.length; i++) {
    for (let j = 0; j < garbage[i].length; j++) {
      const container = garbage[i][j] as "G" | "P" | "M";
      letters[container].count += 1;
      letters[container].lastIndex = i;
    }
  }
  return letters;
}
// @leetup=code
