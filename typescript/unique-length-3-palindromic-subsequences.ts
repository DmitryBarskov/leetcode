// @leetup=custom
// @leetup=info id=1930 lang=typescript slug=unique-length-3-palindromic-subsequences

/*
 * Given a string `s`, return *the number of unique palindromes of length three
 * that are a subsequence of *`s`.
 *
 * Note that even if there are multiple ways to obtain the same subsequence, it is
 * still only counted once.
 *
 * A palindrome is a string that reads the same forwards and backwards.
 *
 * A subsequence of a string is a new string generated from the original string
 * with some characters (can be none) deleted without changing the relative order
 * of the remaining characters.
 *
 * * For example, `"ace"` is a subsequence of `"abcde"`.
 *
 * Example 1:
 *
 * Input: s = "aabca"
 * Output: 3
 * Explanation: The 3 palindromic subsequences of length 3 are:
 * - "aba" (subsequence of "aabca")
 * - "aaa" (subsequence of "aabca")
 * - "aca" (subsequence of "aabca")
 *
 * Example 2:
 *
 * Input: s = "adc"
 * Output: 0
 * Explanation: There are no palindromic subsequences of length 3 in "adc".
 *
 * Example 3:
 *
 * Input: s = "bbcbaba"
 * Output: 4
 * Explanation: The 4 palindromic subsequences of length 3 are:
 * - "bbb" (subsequence of "bbcbaba")
 * - "bcb" (subsequence of "bbcbaba")
 * - "bab" (subsequence of "bbcbaba")
 * - "aba" (subsequence of "bbcbaba")
 *
 * Constraints:
 *
 * * `3 <= s.length <= 105`
 * * `s` consists of only lowercase English letters.
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(countPalindromicSubsequence("aabca"), 3);
  assertEquals(countPalindromicSubsequence("abc"), 0);
  assertEquals(countPalindromicSubsequence("bbcbaba"), 4);
});

Deno.test("my examples", () => {
  assertEquals(countPalindromicSubsequence("aaaaaaaaaaaa"), 1);
  assertEquals(countPalindromicSubsequence("aaaaaaaabaaa"), 2);
  assertEquals(countPalindromicSubsequence("aaabaaaabaaa"), 3);
});
// @leetup=custom
// @leetup=code

function countPalindromicSubsequence(s: string): number {
  const chars = new Map<string, number[]>();
  for (let i = 0; i < s.length; i++) {
    const char = s[i];
    if (!chars.has(char)) {
      chars.set(char, []);
    }
    const positions = chars.get(char)!;
    if (positions.length >= 1) {
      positions[1] = i;
    } else {
      positions[0] = i;
    }
  }

  let result = 0;
  for (const [_, positions] of chars) {
    if (positions.length < 2) {
      continue;
    }

    result += countUniqueChars(s, positions[0], positions.at(-1)!);
  }
  return result;
}

function countUniqueChars(s: string, from: number, to: number): number {
  const set = new Set<string>();
  for (let i = from + 1; i < to; i++) {
    set.add(s[i]);
  }
  return set.size;
}
// @leetup=code
