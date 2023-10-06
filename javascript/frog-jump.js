// https://leetcode.com/problems/frog-jump/
function canCross(stones) {
  if (stones[0] !== 0 || stones[1] !== 1) { return false; }

  let stoneIndeces = new Map(Object.entries(stones).map(([k, v]) => [v, parseInt(k)]));
  console.debug(stoneIndeces);
  let paths = new Array(stones.length);
  for (let i = 0; i < paths.length; i++) {
    paths[i] = new Array(stones.length);
    paths[i].fill(0);
  }
  paths[0][0] = 1;

  for (let stoneIndex = 0; stoneIndex < paths.length; stoneIndex++) {
    let currentStone = stones[stoneIndex];

    for (let previousJump = 0; previousJump < paths.length; previousJump++) {
      for (let jumpChange = -1; jumpChange <= 1; jumpChange++) {
        let nextJump = previousJump + jumpChange;
        if (nextJump <= 0) {
          continue;
        }

        let nextStone = currentStone + nextJump;
        if (stoneIndeces.has(nextStone)) {
          paths[stoneIndeces.get(nextStone)][nextJump] += paths[stoneIndex][previousJump];
        }
      }
    }
  }
  return paths[paths.length - 1].some(p => p > 0);
}
