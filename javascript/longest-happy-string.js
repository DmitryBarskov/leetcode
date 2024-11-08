/**
 * @param {number} a
 * @param {number} b
 * @param {number} c
 * @return {string}
 */
function longestDiverseString(a, b, c) {
    const left = { a: ["a", a], b: ["b", b], c: ["c", c] };
    const str = [];
    let repeats = 1;
    while (Object.values(left).some(([_, c]) => c > 0)) {
        let [popularChar, count] = Object.values(left).reduce(
            (acc, chr) => chr[1] > acc[1] ? chr : acc,
            left.a
        );
        if (popularChar == str.at(-1) && repeats >= 2) {
            [popularChar, count] = Object.values(left).reduce(
                (acc, chr) => chr[0] != popularChar && chr[1] > acc[1] ? chr : acc,
                popularChar !== "a" ? left.a : left.b
            );
            repeats = 1;
        }
        if (count <= 0) {
            break;
        }
        if (popularChar == str.at(-1)) {
            repeats++;
        }
        str.push(popularChar);
        left[popularChar][1]--;
    }
    return str.join("");
}
