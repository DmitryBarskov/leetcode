// @leetup=custom
// @leetup=info id=139 lang=typescript slug=word-break

/*
 * Given a string `s` and a dictionary of strings `wordDict`, return `true` if `s`
 * can be segmented into a space-separated sequence of one or more dictionary
 * words.
 *
 * Note that the same word in the dictionary may be reused multiple times in
 * the segmentation.
 *
 * Example 1:
 *
 * Input: s = "leetcode", wordDict = ["leet","code"]
 * Output: true
 * Explanation: Return true because "leetcode" can be segmented as "leet code".
 *
 * Example 2:
 *
 * Input: s = "applepenapple", wordDict = ["apple","pen"]
 * Output: true
 * Explanation: Return true because "applepenapple" can be segmented as "apple
 * pen apple".
 * Note that you are allowed to reuse a dictionary word.
 *
 * Example 3:
 *
 * Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
 * Output: false
 *
 * Constraints:
 *
 * * `1 <= s.length <= 300`
 * * `1 <= wordDict.length <= 1000`
 * * `1 <= wordDict[i].length <= 20`
 * * `s` and `wordDict[i]` consist of only lowercase English letters.
 * * All the strings of `wordDict` are unique.
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertEquals(wordBreak("leetcode", ["leet", "code"]), true);
  assertEquals(wordBreak("applepenapple", ["apple", "pen"]), true);
  assertEquals(
    wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]),
    false,
  );
});

// @leetup=custom
// @leetup=code

type Char = string & { length: 1 };

type Trie = { value?: number; [k: Char]: Trie; };

const buildTrie = (words: string[]): Trie => {
  const trie: Trie = {};
  for (let i = 0; i < words.length; i++) {
    let currentNode: Trie = trie;
    for (let j = words[i].length - 1; j >= 0; j--) {
      const char: Char = words[i][j] as Char;
      currentNode[char] ??= {};
      currentNode = currentNode[char];
    }
    currentNode.value = words[i].length;
  }
  return trie;
};

function wordBreak(s: string, wordDict: string[]): boolean {
  // wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])
  //         ∑catsandog
  // cats 0: 1001100200
  // {
  //   s: { t: { a: { c: { value: 4 } } } },
  //   g: { o: { d: { value: 3 } } },
  //   d: { n: { a: { s: { value: 4 }, value: 3 } } },
  //   t: { a: { c: { value: 3 } } }
  // }
  const trie = buildTrie(wordDict);
  const dp = new Array<number>(s.length + 1).fill(0);
  dp[0] = 1;
  for (let i = 1; i < dp.length; i++) {
    let currentNode: Trie | undefined = trie;
    for (let j = i - 1; j >= 0; j--) {
      const char = s[j] as Char;
      currentNode = currentNode[char];
      if (currentNode === undefined) {
        break;
      }
      if (currentNode.value) {
        dp[i] += dp[i - currentNode.value];
      }
    }
  }
  console.log({ dp, trie });
  return dp.at(-1)! > 0;
}
// @leetup=code
