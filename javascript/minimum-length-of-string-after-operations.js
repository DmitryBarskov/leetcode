/**
 * @param {string} s
 * @return {number}
 */
function minimumLength(s) {
    const count = new Array(26).fill(0);
    for (let i = 0; i < s.length; i++) {
        count[s.charCodeAt(i) - 'a'.charCodeAt(0)]++;
    }
    return count.reduce((acc, c) => acc + (c <= 2 ? c : (c + 1) % 2 + 1), 0);
}
