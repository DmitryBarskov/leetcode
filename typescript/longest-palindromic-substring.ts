function longestPalindrome(s: string) {
  let maxPailndromeLength = 0;
  let palindrome: [number, number] = [0, 0];
  for (let i = 0; i < s.length; i++) {
    for (let center2 = 0; center2 < 2; center2++) {
      const [from, to] = palindromeWithCenter(s, i, center2);
      const palindromeLength = to - from;
      if (palindromeLength > maxPailndromeLength) {
        maxPailndromeLength = palindromeLength;
        palindrome = [from, to];
      }
    }
  }
  return s.slice(...palindrome);
}

function palindromeWithCenter(str: string, center1: number, center2: number) {
  let i = center1;
  let j = center2;
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
