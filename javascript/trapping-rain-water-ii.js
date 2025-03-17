/**
 * @param {number[][]} heightMap
 * @return {number}
 */
function trapRainWater(heightMap) {
    const queue = new PriorityQueue({ compare: ([h1], [h2]) => h1 - h2 });
    const visited = Array.from(heightMap, (row) => new Array(row.length).fill(false));
    // adding top and bottom edges
    for (const row of [0, heightMap.length - 1]) {
        for (let col = 0; col < heightMap[row].length; col++) {
            queue.enqueue([heightMap[row][col], row, col]);
            visited[row][col] = true;
        }
    }
    // adding left and right edges
    for (let row = heightMap.length - 2; row >= 1; row--) {
        queue.enqueue([heightMap[row][0], row, 0]);
        visited[row][0] = true;

        const lastCol = heightMap[row].length - 1;
        queue.enqueue([heightMap[row][lastCol], row, lastCol]);
        visited[row][lastCol] = true;
    }

    let maxHeight = -1;
    let totalVolume = 0;
    while (!queue.isEmpty()) {
        const [height, r, c] = queue.dequeue();
        maxHeight = Math.max(maxHeight, height);
        totalVolume += maxHeight - height;

        const neighbors = [[r, c + 1], [r, c - 1], [r + 1, c], [r - 1, c]]
            .filter(([y, _]) => 0 <= y && y < heightMap.length)
            .filter(([y, x]) => 0 <= x && x < heightMap[y].length)
            .filter(([y, x]) => !visited[y][x]);
        for (const [y, x] of neighbors) {
            queue.enqueue([heightMap[y][x], y, x]);
            visited[y][x] = true;
        }
    }
    return totalVolume;
}
