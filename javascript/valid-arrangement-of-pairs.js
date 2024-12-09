/**
 * @param {number[][]} pairs
 * @return {number[][]}
 */
function validArrangement(pairs) {
    const graph = new Map();
    const inDegree = new Map();

    for (const [from, to] of pairs) {
        if (!graph.has(from)) {
            graph.set(from, []);
        }
        graph.get(from).push(to);
        inDegree.set(to, (inDegree.get(to) ?? 0) + 1);
    }

    const start = findStart(graph, inDegree) ?? pairs[0][0];

    // Hierholzer's algorithm 
    const path = new Array(pairs.length);
    let filled = path.length - 1;
    const traverse = (vertex) => {
        while (graph.has(vertex) && graph.get(vertex).length > 0) {
            const next = graph.get(vertex).pop();
            traverse(next);
            path[filled] = [vertex, next];
            filled -= 1;
        }
    };

    traverse(start);
    return path;
}

function findStart(graph, inDegree) {
    for (const [vertex, edges] of graph) {
        if (edges.length - (inDegree.get(vertex) ?? 0) === 1) {
            return vertex;
        }
    }
}
