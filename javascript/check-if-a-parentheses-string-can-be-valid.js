/**
 * @param {string} s
 * @param {string} locked
 * @return {boolean}
 */
function canBeValid(s, locked) {
    if (s.length % 2 !== 0) { return false; }

    let min = 0;
    let max = 0;
    for (let i = 0; i < s.length; i++) {
        if (locked[i] === '0') {
            min--;
            max++;
        } else if (s[i] === '(') {
            min++;
            max++;
        } else {
            min--;
            max--;
        }
        min = Math.max(0, min);
        if (max < 0) { return false; }
    }
    return min === 0;
}
