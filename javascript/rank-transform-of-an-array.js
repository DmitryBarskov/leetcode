/**
 * @param {number[]} arr
 * @return {number[]}
 */
function arrayRankTransform(arr) {
    let sorted = arr.slice().sort((a, b) => a - b);
    let ranks = new Map();
    let rank = 1;
    for (let i = 0; i < sorted.length; i++) {
        if (sorted[i] === sorted[i - 1]) {
            continue;
        }
        ranks.set(sorted[i], rank);
        rank++;
    }
    return arr.map(x => ranks.get(x));
}
