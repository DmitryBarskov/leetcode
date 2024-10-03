/**
 * @param {number[]} arr1
 * @param {number[]} arr2
 * @return {number}
 */
function longestCommonPrefix(arr1, arr2) {
  const trie = trieNew(arr1.map(num => num.toString()));
  let longest = 0;
  for (const num of arr2) {
    longest = Math.max(longest, prefixLength(trie, num.toString()));
  }
  return longest;
}

/**
 * @param {string[]} strs
 */
function trieNew(strs) {
  const trie = {};
  for (const word of strs) {
    trieAdd(trie, word);
  }
  return trie;
}

/**
 * @typedef {{ [key: string]: Trie | null }} Trie
 * @param {Trie} trie
 * @param {string} word
 */
function trieAdd(trie, word) {
  let t = trie;
  for (let i = 0; i < word.length; i++) {
    t[word[i]] ??= {};
    t = t[word[i]];
  }
  t[""] = true;
}

function prefixLength(trie, word) {
  let t = trie;
  let prefix = 0;
  while (t != undefined) {
    t = t[word[prefix]];
    prefix++;
  }
  return prefix - 1;
}

import { assertEquals } from "jsr:@std/assert";

Deno.test("examples", () => {
  assertEquals(longestCommonPrefix([1,10,100], [1000]), 3);
  assertEquals(longestCommonPrefix([1,2,3], [4,4,4]), 0);
});
