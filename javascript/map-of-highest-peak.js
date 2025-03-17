/**
 * @param {number[][]} isWater
 * @return {number[][]}
 */
function highestPeak(isWater) {
    const queue = new Queue();
    for (let i = 0; i < isWater.length; i++) {
        for (let j = 0; j < isWater[i].length; j++) {
            if (isWater[i][j] === 1) {
                queue.enqueue([i, j, 0]);
            }
        }
    }
    const land = Array.from(isWater, (r) => new Array(r.length));

    while (!queue.isEmpty()) {
        const [row, col, height] = queue.dequeue();
        if (row < 0 || land.length <= row || col < 0 || land[row].length <= col) {
            continue;
        }
        if (land[row][col] <= height) {
            continue;
        }
        land[row][col] = height;
        for (const [y, x] of adjacent(row, col)) {
            queue.enqueue([y, x, height + 1]);
        }
    }
    
    return land;
}

function adjacent(row, col) {
    return [
        [row - 1, col],
        [row + 1, col],
        [row, col - 1],
        [row, col + 1],
    ];
}
