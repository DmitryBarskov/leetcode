/**
 * @param {number[][]} heights
 * @return {number[][]}
 */
function pacificAtlantic(heights) {
  let canReachFromPacific = Array.from(
    heights, (row) => new Array(row.length).fill(false)
  );
  let canReachFromAtlantic = Array.from(
    heights, (row) => new Array(row.length).fill(false)
  );

  const reach = (grid, stack) => {
    [];
    while (stack.length > 0) {
      let [i, j] = stack.pop();

      if (grid[i][j]) { continue; }

      grid[i][j] = true;

      for (const [ni, nj] of [[i + 1, j], [i - 1, j], [i, j + 1], [i, j - 1]]) {
        if (ni < 0 || grid.length <= ni) { continue; }
        if (nj < 0 || grid[ni].length <= nj) { continue; }

        // we should go UP in heights
        if (heights[ni][nj] >= heights[i][j]) {
          stack.push([ni, nj]);
        }
      }
    }
  };

  reach(
    canReachFromPacific,
    Array.from({ length: heights.length }, (_, i) => [i, 0]).concat(
      Array.from({ length: heights[0].length - 1 }, (_, j) => [0, j + 1])
    )
  );

  reach(
    canReachFromAtlantic,
    Array.from({ length: heights.length }, (_, i) => [i, heights[i].length - 1]).concat(
      Array.from({ length: heights[0].length - 1 }, (_, j) => [heights.length - 1, j])
    )
  );

  const result = [];
  for (let i = 0; i < heights.length; i++) {
    for (let j = 0; j < heights[i].length; j++) {
      if (canReachFromPacific[i][j] && canReachFromAtlantic[i][j]) {
        result.push([i, j]);
      }
    }
  }

  return result;
};
