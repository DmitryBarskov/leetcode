// const { PriorityQueue } = require('@datastructures-js/priority-queue');

/**
 * Returns the minimum changes required to make the grid walkable
 * from top left to bottom right. Walkable means following direction
 * in each cell. 1 - right, 2 - left, 3 - down, 4 - up.
 * Example:
 * Input: grid = [[1,1,1,1],[2,2,2,2],[1,1,1,1],[2,2,2,2]]
 * Output: 3
 * @param {number[][]} grid
 * @return {number}
 */
function minCost(grid) {
    const rows = grid.length;
    const cols = grid[0].length;
    const minDistance = matrix(rows, cols);

    const nextCells = new PriorityQueue({
        compare: ([_r1, _c1, d1], [_r2, _c2, d2]) => d1 - d2,
    });
    nextCells.enqueue([0, 0, 0]);

    while (minDistance[rows - 1][cols - 1] === undefined) {
        const [row, col, dist] = nextCells.dequeue();
        if (minDistance[row][col] !== undefined) {
            continue;
        }
        minDistance[row][col] = dist;

        for (const [r, c, d] of adjacentCells(grid, row, col)) {
            nextCells.enqueue([r, c, dist + d]);
        }
    }
    return minDistance[rows - 1][cols - 1];
}

function matrix(rows, cols) {
    const m = new Array(rows);
    for (let i = 0; i < m.length; i++) {
        m[i] = new Array(cols);
    }
    return m;
}

// 1 - right, 2 - left, 3 - down, 4 - up.
const directions = [
    [1, [0, 1]],
    [2, [0, -1]],
    [3, [1, 0]],
    [4, [-1, 0]],
];

function adjacentCells(grid, row, col) {
    return directions
        .map(([key, [dy, dx]]) => [row + dy, col + dx, grid[row]?.[col] === key ? 0 : 1])
        .filter(([r, c, _d]) => 0 <= r && r < grid.length && 0 <= c && c < grid[row].length)
    ;
}
