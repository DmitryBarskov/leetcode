// https://leetcode.com/problems/clone-graph/

/**
 * Definition for Node.
 * class Node {
 *     val: number
 *     neighbors: Node[]
 *     constructor(val?: number, neighbors?: Node[]) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.neighbors = (neighbors===undefined ? [] : neighbors)
 *     }
 * }
 */

function cloneGraph(node: Node | null): Node | null {
  if (node === null) {
    return null;
  }
  const clones = new Map<number, Node>();
  const toBeCloned = new Array<Node>();
  toBeCloned.push(node);

  while (toBeCloned.length > 0) {
    const original = toBeCloned.pop()!;
    const nodeClone = clones.get(original.val) ?? new Node(original.val);

    if (!clones.has(original.val)) {
      clones.set(original.val, nodeClone);
    }

    original.neighbors.forEach(neighbor => {
      const neighborClone = clones.get(neighbor.val) ?? new Node(neighbor.val);
      if (!clones.has(neighbor.val)) {
        toBeCloned.push(neighbor);
        clones.set(neighbor.val, neighborClone);
      }
      nodeClone.neighbors.push(neighborClone);
    });
  }

  return clones.get(node.val) ?? null;
}

import { assertEquals, assertNotStrictEquals, assertStrictEquals } from "std/assert/mod.ts";
import Node from "./func/GraphNode.ts";

Deno.test("exaxmples", () => {
  const sortNodesByValue = (n1: Node, n2: Node) => n1.val - n2.val;

  const one = new Node(1);
  const two = new Node(2);
  const three = new Node(3);
  const four = new Node(4);

  one.neighbors = [two, four];
  two.neighbors = [one, three];
  three.neighbors = [two, four];
  four.neighbors = [one, three];

  const newOne = cloneGraph(one);
  const [newTwo, newFour] = newOne!.neighbors.sort(sortNodesByValue);
  const [_, newThree] = newTwo.neighbors.sort(sortNodesByValue);

  assertEquals(newOne?.val, 1);
  assertEquals(newTwo?.val, 2);
  assertEquals(newThree?.val, 3);
  assertEquals(newFour?.val, 4);

  assertNotStrictEquals(newOne, one);
  assertNotStrictEquals(newTwo, two);
  assertNotStrictEquals(newThree, three);
  assertNotStrictEquals(newFour, four);
});

Deno.test("single", () => {
  const one = new Node(1);

  const newOne = cloneGraph(one);

  assertEquals(newOne?.val, 1);

  assertNotStrictEquals(newOne, one);
});

Deno.test("empty", () => {
  const newGraph = cloneGraph(null);

  assertStrictEquals(newGraph, null);
});
