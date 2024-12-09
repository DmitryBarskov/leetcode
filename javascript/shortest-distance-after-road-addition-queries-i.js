// const { Queue } = require('@datastructures-js/queue');

/**
 * @param {number} n
 * @param {number[][]} queries
 * @return {number[]}
 */
function shortestDistanceAfterQueries(n, queries) {
    const graph = new Array(n);
    for (let i = 1; i < n; i++) {
        graph[i - 1] = [i];
    }
    graph[n - 1] = [];
    return queries.map(([from, to]) => {
        graph[from].push(to);
        return bfsDistance(graph, 0, n - 1);
    });
}

function bfsDistance(graph, from, to) {
    const queue = new Queue([[from, 0]]);
    const visited = new Set();
    while (queue.size() > 0) {
        const [node, distance] = queue.dequeue();
        if (node == to) {
            return distance;
        }
        if (visited.has(node)) {
            continue;
        }
        visited.add(node);
        for (const adj of graph[node]) {
            queue.enqueue([adj, distance + 1]);
        }
    }
    return Infinity;
}

// deno required
import { Queue } from 'npm:@datastructures-js/queue';
import { equal } from "jsr:@std/assert/equal";

Deno.test("basic tests", () => {
    equal(shortestDistanceAfterQueries(5, [[2, 4], [0, 2], [0, 4]]), [3, 2, 1]);
    equal(shortestDistanceAfterQueries(4, [[0, 3], [0, 2]]), [1, 1]);
});
