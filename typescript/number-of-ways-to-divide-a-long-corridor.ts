// @leetup=custom
// @leetup=info id=2147 lang=typescript slug=number-of-ways-to-divide-a-long-corridor

/*
 * Along a long library corridor, there is a line of seats and decorative plants.
 * You are given a 0-indexed string `corridor` of length `n` consisting of
 * letters `'S'` and `'P'` where each `'S'` represents a seat and each `'P'`
 * represents a plant.
 *
 * One room divider has already been installed to the left of index `0`, and
 * another to the right of index `n - 1`. Additional room dividers can be
 * installed. For each position between indices `i - 1` and `i` (`1 <= i <= n -
 * 1`), at most one divider can be installed.
 *
 * Divide the corridor into non-overlapping sections, where each section has
 * exactly two seats with any number of plants. There may be multiple ways to
 * perform the division. Two ways are different if there is a position with a
 * room divider installed in the first way but not in the second way.
 *
 * Return *the number of ways to divide the corridor*. Since the answer may be very
 * large, return it modulo `109 + 7`. If there is no way, return `0`.
 *
 * Example 1:
 *
 * Input: corridor = "SSPPSPS"
 * Output: 3
 * Explanation: There are 3 different ways to divide the corridor.
 * The black bars in the above image indicate the two room dividers already install
 * ed.
 * Note that in each of the ways, each section has exactly two seats.
 *
 * Example 2:
 *
 * Input: corridor = "PPSPSP"
 * Output: 1
 * Explanation: There is only 1 way to divide the corridor, by not installing a
 * ny additional dividers.
 * Installing any would create some section that does not have exactly two seats.
 *
 * Example 3:
 *
 * Input: corridor = "S"
 * Output: 0
 * Explanation: There is no way to divide the corridor because there will alway
 * s be a section that does not have exactly two seats.
 *
 * Constraints:
 *
 * * `n == corridor.length`
 * * `1 <= n <= 10^5`
 * * `corridor[i]` is either `'S'` or `'P'`.
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("example 1", () => {
  assertEquals(numberOfWays("SSPPSPS"), 3);
});

Deno.test("example 2", () => {
  assertEquals(numberOfWays("PPSPSP"), 1);
});

Deno.test("example 3", () => {
  assertEquals(numberOfWays("S"), 0);
});

Deno.test("extra", () => {
  assertEquals(
    ["SPPSSSSPPS", "PPSPPPSSSPPPSSP", "SSPPPPPPPPPPPPPPPPPPPPSS", "SSPPPSSPPPPSSPPPSSPPPSSPPPPSSPPPSS"].map(numberOfWays),
    [1, 4, 21, 6400]
  )
});

Deno.test("failed", () => {
  assertEquals(numberOfWays("P"), 0);
});
// @leetup=custom
// @leetup=code

const MOD = 1_000_000_007;
const product = (a: number, b: number) => (a * b) % MOD;

function numberOfWays(corridor: string): number {
  // Skip plants at the beginning
  let firstSeat = 0;
  while (firstSeat < corridor.length && corridor[firstSeat] !== 'S') {
    firstSeat++;
  }
  // Skip plants at the end
  let lastSeat = corridor.length - 1;
  while (firstSeat < lastSeat && corridor[lastSeat] !== 'S') {
    lastSeat--;
  }
  const wallPositions = [];
  let i = firstSeat;
  while (i <= lastSeat) {
    if (corridor[i] === 'S') {
      let seatCount = 0;
      while (i <= lastSeat && seatCount < 2) {
        if (corridor[i] === 'S') {
          seatCount++;
        }
        i++;
      }
      if (seatCount === 1) {
        return 0;
      }
      let plantsCount = 0;
      while (i <= lastSeat && corridor[i] === 'P') {
        plantsCount++;
        i++;
      }
      wallPositions.push(plantsCount + 1);
    } else {
      i++;
    }
  }
  if (wallPositions.length === 0) {
    return 0;
  }
  return wallPositions.reduce(product, 1);
}
// @leetup=code
