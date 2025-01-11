/**
 * @param {string} s
 * @param {number} k
 * @return {boolean}
 */
function canConstruct(s, k) {
    if (k > s.length) {
        return false;
    }
    const charsCount = new Array(26).fill(0);
    for (let i = 0; i < s.length; i++) {
        charsCount[s.codePointAt(i) - 'a'.codePointAt(0)]++;
    }
    let odd = 0;
    for (const count of charsCount) {
        if (count % 2 == 1) {
            odd++;
        }
    }
    return odd <= k;
}
