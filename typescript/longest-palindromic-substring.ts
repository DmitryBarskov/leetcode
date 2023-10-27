function longestPalindrome(s: string): string {
  let longestPalindromeInterval: [number, number] = [0, 0];
  for (let i = 0; i < s.length; i++) {
    let [from, to] = longestPalindromeFromIndex(s, i);
    if (
      to - from > longestPalindromeInterval[1] - longestPalindromeInterval[0]
    ) {
      longestPalindromeInterval = [from, to];
    }
    [from, to] = longestPalindromeFromIndex(s, i, i + 1);
    if (
      to - from > longestPalindromeInterval[1] - longestPalindromeInterval[0]
    ) {
      longestPalindromeInterval = [from, to];
    }
  }
  return s.slice(...longestPalindromeInterval);
}

function longestPalindromeFromIndex(
  str: string,
  index1: number,
  index2: number = index1,
): [number, number] {
  let i = index1;
  let j = index2;
  while (i >= 0 && j < str.length && str[i] === str[j]) {
    i -= 1;
    j += 1;
  }

  return [i + 1, j];
}

import { assertArrayIncludes, assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(longestPalindrome("cbbd"), "bb");
  assertArrayIncludes(["bab", "aba"], [longestPalindrome("babad")]);
  assertArrayIncludes(["a", "b", "c", "d"], [longestPalindrome("abcd")]);
});
