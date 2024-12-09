/**
 * @param {number} n
 * @param {number[][]} edges
 * @return {number}
 */
function findChampion(n, edges) {
    const weak = new Set();
    for (const [_stronger, weaker] of edges) {
        weak.add(weaker);
    }
    if (weak.size == n - 1) {
        return -1;
    }
    for (let i = 0; i < n; i++) {
        if (!weak.has(i)) {
            return i;
        }
    }
}
