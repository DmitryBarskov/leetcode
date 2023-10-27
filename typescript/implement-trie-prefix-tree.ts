// https://leetcode.com/problems/implement-trie-prefix-tree/description/

const ALPHABET_SIZE = 26;

type TrieNode = {
  children: Array<TrieNode>;
  value: boolean;
};

const newTrieNode = (): TrieNode => {
  return { children: new Array<TrieNode>(ALPHABET_SIZE), value: false };
};

class Trie {
  private tree: TrieNode;

  constructor() {
    this.tree = newTrieNode();
  }

  insert(word: string): void {
    let currentNode: TrieNode = this.tree;
    for (let i = 0; i < word.length; i++) {
      currentNode.children[word.charCodeAt(i) - "a".charCodeAt(0)] ??=
        newTrieNode();
      currentNode =
        currentNode.children[word.charCodeAt(i) - "a".charCodeAt(0)];
    }
    currentNode.value = true;
  }

  search(word: string): boolean {
    let currentNode: TrieNode = this.tree;
    for (let i = 0; i < word.length; i++) {
      if (currentNode === null || currentNode === undefined) {
        return false;
      }
      currentNode =
        currentNode.children[word.charCodeAt(i) - "a".charCodeAt(0)];
    }
    return currentNode?.value ?? false;
  }

  startsWith(prefix: string): boolean {
    let currentNode: TrieNode = this.tree;
    for (let i = 0; i < prefix.length; i++) {
      if (currentNode === null || currentNode === undefined) {
        return false;
      }
      currentNode =
        currentNode.children[prefix.charCodeAt(i) - "a".charCodeAt(0)];
    }
    return currentNode !== undefined && currentNode !== null;
  }
}

/**
 * Your Trie object will be instantiated and called as such:
 * var obj = new Trie()
 * obj.insert(word)
 * var param_2 = obj.search(word)
 * var param_3 = obj.startsWith(prefix)
 */
import { assert, assertFalse } from "std/assert/mod.ts";

Deno.test("examples", () => {
  const trie = new Trie();
  trie.insert("apple");
  assert(trie.search("apple"));
  assertFalse(trie.search("app"));
  assert(trie.startsWith("app"));
  trie.insert("app");
  assert(trie.search("app"));
});

Deno.test("extra", () => {
  const trie = new Trie();
  assertFalse(trie.search("a"));
  assertFalse(trie.startsWith("a"));
});

Deno.test("empty", () => {
  const trie = new Trie();
  assertFalse(trie.search(""));
  trie.insert("");
  assert(trie.search(""));
});

Deno.test("extra 2", () => {
  // ["Trie","insert","startsWith"]
  // [[],["hotdog"],["dog"]]
  const trie = new Trie();
  trie.insert("hotdog");
  assertFalse(trie.startsWith("dog"));
})
