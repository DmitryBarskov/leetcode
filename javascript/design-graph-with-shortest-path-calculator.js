// @leetup=custom
// @leetup=info id=2642 lang=javascript slug=design-graph-with-shortest-path-calculator

/*
 * There is a directed weighted graph that consists of `n` nodes numbered from
 * `0` to `n - 1`. The edges of the graph are initially represented by the given
 * array `edges` where `edges[i] = [from[i], to[i], edgeCost[i]]` meaning that there is
 * an edge from `from[i]` to `to[i]` with the cost `edgeCost[i]`.
 *
 * Implement the `Graph` class:
 *
 * * `Graph(int n, int[][] edges)` initializes the object with `n` nodes and the
 *   given edges.
 * * `addEdge(int[] edge)` adds an edge to the list of edges where `edge = [from,
 *   to, edgeCost]`. It is guaranteed that there is no edge between the two nodes
 *   before adding this one.
 * * `int shortestPath(int node1, int node2)` returns the minimum cost of a
 *   path from `node1` to `node2`. If no path exists, return `-1`. The cost of a
 *   path is the sum of the costs of the edges in the path.
 *
 * Example 1:
 * https://assets.leetcode.com/uploads/2023/01/11/graph3drawio-2.png
 * Input
 * ["Graph", "shortestPath", "shortestPath", "addEdge", "shortestPath"]
 * [[4, [[0, 2, 5], [0, 1, 2], [1, 2, 1], [3, 0, 3]]], [3, 2], [0, 3], [[1, 3, 4]],
 *  [0, 3]]
 * Output
 * [null, 6, -1, null, 6]
 *
 * Explanation
 * Graph g = new Graph(4, [[0, 2, 5], [0, 1, 2], [1, 2, 1], [3, 0, 3]]);
 * g.shortestPath(3, 2); // return 6. The shortest path from 3 to 2 in the first di
 * agram above is 3 -> 0 -> 1 -> 2 with a total cost of 3 + 2 + 1 = 6.
 * g.shortestPath(0, 3); // return -1. There is no path from 0 to 3.
 * g.addEdge([1, 3, 4]); // We add an edge from node 1 to node 3, and we get the se
 * cond diagram above.
 * g.shortestPath(0, 3); // return 6. The shortest path from 0 to 3 now is 0 -> 1 -
 * > 3 with a total cost of 2 + 4 = 6.
 *
 * Constraints:
 *
 * * `1 <= n <= 100`
 * * `0 <= edges.length <= n * (n - 1)`
 * * `edges[i].length == edge.length == 3`
 * * `0 <= fromi, toi, from, to, node1, node2 <= n - 1`
 * * `1 <= edgeCosti, edgeCost <= 106`
 * * There are no repeated edges and no self-loops in the graph at any point.
 * * At most `100` calls will be made for `addEdge`.
 * * At most `100` calls will be made for `shortestPath`.
 */

import { assertEquals } from "std/assert/mod.ts";
import { zip3 } from "../typescript/func/zip.ts";

Deno.test("example 1", () => {
  const g = new Graph(4, [[0, 2, 5], [0, 1, 2], [1, 2, 1], [3, 0, 3]]);
  assertEquals(g.shortestPath(3, 2), 6);
  assertEquals(g.shortestPath(0, 3), -1);
  g.addEdge([1, 3, 4]);
  assertEquals(g.shortestPath(0, 3), 6);
});

Deno.test("failed testcase", () => {
  const g = new Graph(13, [
    [11, 6, 84715],
    [7, 9, 764823],
    [6, 0, 315591],
    [1, 4, 909432],
    [6, 5, 514907],
    [9, 6, 105610],
    [3, 10, 471042],
    [7, 10, 348752],
    [5, 11, 715628],
    [6, 1, 973999],
    [8, 7, 593929],
    [7, 6, 64688],
    [6, 4, 741734],
    [10, 1, 894247],
    [9, 7, 81181],
    [2, 11, 75418],
    [12, 2, 85431],
    [7, 2, 260306],
    [11, 9, 640614],
    [2, 3, 648804],
    [4, 12, 568023],
    [0, 8, 730096],
    [9, 11, 633474],
    [3, 6, 390214],
    [1, 10, 117955],
    [9, 8, 222602],
    [10, 7, 689294],
  ]);

  zip3(
    [
      "addEdge",
      "addEdge",
      "addEdge",
      "addEdge",
      "addEdge",
      "shortestPath",
      "shortestPath",
      "shortestPath",
      "addEdge",
      "addEdge",
      "addEdge",
      "shortestPath",
      "addEdge",
      "addEdge",
      "shortestPath",
      "shortestPath",
      "shortestPath",
      "addEdge",
      "addEdge",
      "shortestPath",
      "shortestPath",
      "shortestPath",
      "shortestPath",
      "addEdge",
      "addEdge",
      "shortestPath",
      "shortestPath",
      "shortestPath",
      "shortestPath",
      "shortestPath",
      "addEdge",
      "shortestPath",
      "addEdge",
      "shortestPath",
      "shortestPath",
      "shortestPath",
      "addEdge",
      "shortestPath",
      "shortestPath",
      "shortestPath",
      "shortestPath",
      "shortestPath",
      "addEdge",
      "shortestPath",
      "shortestPath",
      "shortestPath",
    ],
    [
      [[1, 2, 36450]],
      [[8, 0, 709628]],
      [[2, 4, 30185]],
      [[12, 1, 21696]],
      [[1, 8, 2553]],
      [8, 9],
      [1, 11],
      [3, 4],
      [[4, 6, 2182]],
      [[7, 5, 206]],
      [[5, 7, 140]],
      [12, 5],
      [[12, 6, 365184]],
      [[3, 2, 5]],
      [4, 8],
      [7, 10],
      [0, 5],
      [[0, 11, 5]],
      [[1, 7, 5]],
      [0, 8],
      [11, 11],
      [7, 4],
      [0, 12],
      [[3, 9, 858944]],
      [[0, 9, 4]],
      [3, 5],
      [4, 5],
      [12, 9],
      [9, 8],
      [3, 5],
      [[12, 9, 629052]],
      [3, 8],
      [[4, 0, 545201]],
      [11, 8],
      [4, 11],
      [9, 6],
      [[12, 7, 4]],
      [7, 10],
      [2, 5],
      [6, 11],
      [12, 2],
      [9, 7],
      [[4, 3, 879736]],
      [1, 3],
      [1, 0],
      [4, 6],
    ],
    [
      null,
      null,
      null,
      null,
      null,
      1358752,
      111868,
      1131948,
      null,
      null,
      null,
      605420,
      null,
      null,
      592272,
      348752,
      1324231,
      null,
      null,
      730096,
      0,
      290491,
      1394477,
      null,
      null,
      429354,
      399164,
      401984,
      222602,
      429354,
      null,
      570569,
      null,
      622912,
      317778,
      105610,
      null,
      348752,
      429349,
      315596,
      58146,
      81181,
      null,
      685254,
      380284,
      2182,
    ],
  ).forEach(([method, args, expectedResult]) => {
    const actual = g[method](...args);
    assertEquals(actual, expectedResult ?? undefined);
  });
});

// @leetup=custom
// @leetup=code
class BinaryHeap {
  constructor(compareFn) {
    this.array = [];
    this.compareFn = compareFn;
  }

  min() {
    return this.array[0];
  }

  extractMin() {
    if (this.size() <= 1) {
      return this.array.pop();
    }
    const min = this.min();
    this.array[0] = this.array.pop();
    this.#siftDown(0);
    return min;
  }

  insert(item) {
    this.array.push(item);
    this.#sfitUp(this.size() - 1);
  }

  size() {
    return this.array.length;
  }

  #siftDown(from) {
    const left = 2 * from + 1;
    if (left >= this.size()) return;

    const right = 2 * from + 2;

    if (
      this.compareFn(this.array[from], this.array[left]) <= 0 &&
      (right >= this.size() || this.compareFn(this.array[from], this.array[right]) <= 0)
    ) {
      return;
    }

    if (right >= this.size() || this.compareFn(this.array[left], this.array[right]) < 0) {
      [this.array[left], this.array[from]] = [
        this.array[from],
        this.array[left],
      ];
      this.#siftDown(left);
    } else if (right < this.size()) {
      [this.array[right], this.array[from]] = [
        this.array[from],
        this.array[right],
      ];
      this.#siftDown(right);
    }
  }

  #sfitUp(from) {
    if (from <= 0) return;

    const parent = Math.trunc((from - 1) / 2);
    if (this.compareFn(this.array[parent], this.array[from]) < 0) {
      return;
    }

    [this.array[parent], this.array[from]] = [this.array[from], this.array[parent]];
    this.#sfitUp(parent);
  }
}

class Graph {
  /**
   * @param {number} n
   * @param {number[][]} edges
   */
  constructor(n, edges) {
    this.adjacency = new Array(n);
    for (let i = 0; i < n; i++) {
      this.adjacency[i] = new Array(n);
    }
    edges.forEach((edge) => this.addEdge(edge));
  }

  /**
   * @param {number[]} edge
   * @return {void}
   */
  addEdge([from, to, cost]) {
    this.adjacency[from][to] = cost;
  }

  /**
   * @param {number} source
   * @param {number} destination
   * @return {number}
   */
  shortestPath(source, destination) {
    const availableNodes = new BinaryHeap(([_n1, cost1], [_n2, cost2]) => cost1 - cost2);
    const shortestPaths = new Map([[source, 0]]);
    this.adjacency[source].forEach((cost, node) => {
      if (cost) {
        availableNodes.insert([node, cost]);
      }
    });
    while (availableNodes.size() > 0 && !shortestPaths.has(destination)) {
      const [closestNode, cost] = availableNodes.extractMin();
      if (shortestPaths.has(closestNode)) {
        continue;
      }
      shortestPaths.set(closestNode, cost);
      this.adjacency[closestNode].forEach((extraCost, node) => {
        availableNodes.insert([node, cost + extraCost]);
      });
    }
    return shortestPaths.get(destination) ?? -1;
  }
}

/**
 * Your Graph object will be instantiated and called as such:
 * var obj = new Graph(n, edges)
 * obj.addEdge(edge)
 * var param_2 = obj.shortestPath(node1,node2)
 */
// @leetup=code
