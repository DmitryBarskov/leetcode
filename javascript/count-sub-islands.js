function countSubIslands(grid1: number[][], grid2: number[][]): number {
    const visited = new Array<Array<boolean>>(grid2.length);
    for (let i = 0; i < visited.length; i++) {
        visited[i] = new Array<boolean>(grid2[i].length);
    }
    let subIslands = 0;
    const recur = (i, j) => {
        if (i < 0 || i >= grid2.length) { return true; }
        if (j < 0 || j >= grid2[i].length) { return true; }
        if (visited[i][j] != undefined) { return visited[i][j]; }
        if (grid2[i][j] == 0) { return true; }

        visited[i][j] = grid1[i][j] == 1;
        visited[i][j] &&= recur(i - 1, j) && recur(i + 1, j) &&
            recur(i, j - 1) && recur(i, j + 1);
        return visited[i][j];
    };
    for (let i = 0; i < grid2.length; i++) {
        for (let j = 0; j < grid2[i].length; j++) {
            if (visited[i][j] != undefined || grid2[i][j] == 0) {
                continue;
            }
            if (recur(i, j)) {
                subIslands++;
            }
        }
    }
    return subIslands;
}
