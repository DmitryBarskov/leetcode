function countSubstrings(s: string): number {
  let palindromes = 0;
  for (let i = 0; i < s.length; i++) {
    palindromes += countPalindromes(s, i, i);
    palindromes += countPalindromes(s, i, i + 1);
  }
  return palindromes;
}

function countPalindromes(str: string, center1: number, center2: number): number {
  let palindromes = 0;
  
  let i = center1;
  let j = center2;
  while (i >= 0 && j < str.length && str[i] === str[j]) {
    palindromes++;
    i--;
    j++;
  }

  return palindromes;
}

import { test, expect } from "bun:test";

test("example 1", () => {
  expect(countSubstrings("abc")).toEqual(3);
  expect(countSubstrings("aaa")).toEqual(6);
});
