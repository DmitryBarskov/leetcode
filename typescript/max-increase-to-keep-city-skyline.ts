// https://leetcode.com/problems/max-increase-to-keep-city-skyline/description/

function maxIncreaseKeepingSkyline(grid: number[][]) {
  const rowMax = new Array<number>(grid.length);
  for (let row = 0; row < grid.length; row++) {
    for (let col = 0; col < grid[row].length; col++) {
      if (rowMax[row] === undefined || grid[row][col] > rowMax[row]) {
        rowMax[row] = grid[row][col];
      }
    }
  }
  const colMax = new Array<number>(grid[0].length);
  for (let col = 0; col < grid[0].length; col++) {
    for (let row = 0; row < grid.length; row++) {
      if (colMax[col] === undefined || grid[row][col] > colMax[col]) {
        colMax[col] = grid[row][col];
      }
    }
  }

  let extraBuilds = 0;
  for (let row = 0; row < grid.length; row++) {
    for (let col = 0; col < grid[row].length; col++) {
      extraBuilds += Math.min(rowMax[row], colMax[col]) - grid[row][col];
    }
  }

  return extraBuilds;
};


maxIncreaseKeepingSkyline([[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]);
