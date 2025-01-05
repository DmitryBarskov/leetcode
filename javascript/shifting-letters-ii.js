const aCode = 'a'.charCodeAt(0);
const letters = 26;

const charCodesFromString = (str) =>
    Array.from(str, (char) => char.charCodeAt(0) - aCode);

const stringFromCharCodes = (codes) =>
    codes.map(c => String.fromCharCode(c + aCode)).join("");

/**
 * @param {string} s
 * @param {number[][]} shifts
 * @return {string}
 */
function shiftingLetters(s, shifts) {
    const shiftSum = new Array(s.length + 1).fill(0);
    for (const [start, end, direction] of shifts) {
        if (direction == 1) {
            shiftSum[start] = (shiftSum[start] + 1) % letters;
            shiftSum[end + 1] = (shiftSum[end + 1] - 1) % letters;
        } else {
            shiftSum[start] = (shiftSum[start] - 1) % letters;
            shiftSum[end + 1] = (shiftSum[end + 1] + 1) % letters;
        }
    }
    const code = charCodesFromString(s);
    let shift = 0;
    for (let i = 0; i < code.length; i++) {
        shift = (shift + shiftSum[i]) % letters;
        code[i] = (code[i] + shift + letters) % letters;
    }
    return stringFromCharCodes(code);
}
