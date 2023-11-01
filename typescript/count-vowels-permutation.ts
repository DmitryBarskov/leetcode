// https://leetcode.com/problems/count-vowels-permutation/description/

const sum = (...nums: number[]) =>
  nums.reduce((a, b) => (a + b) % 1_000_000_007, 0);

/*
  Each character is a lower case vowel ('a', 'e', 'i', 'o', 'u')
  Each vowel 'a' may only be followed by an 'e'.
  Each vowel 'e' may only be followed by an 'a' or an 'i'.
  Each vowel 'i' may not be followed by another 'i'.
  Each vowel 'o' may only be followed by an 'i' or a 'u'.
  Each vowel 'u' may only be followed by an 'a'.
 */
function countVowelPermutation(n: number) {
  if (n === 0) return 0;

  let state = { a: 1, e: 1, i: 1, o: 1, u: 1 };
  for (let i = 1; i < n; i++) {
    state = {
      a: state.e,
      e: sum(state.a, state.i),
      i: sum(state.a, state.e, state.o, state.u),
      o: sum(state.i, state.u),
      u: state.a,
    };
  }

  return sum(state.a, state.e, state.i, state.o, state.u);
}

import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(countVowelPermutation(1), 5);
  assertEquals(countVowelPermutation(2), 10);
  assertEquals(countVowelPermutation(5), 68);
});

Deno.test("large", () => {
  assertEquals(countVowelPermutation(20_000), 20);
});
