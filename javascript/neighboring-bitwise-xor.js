/**
 * @param {number[]} derived
 * @return {boolean}
 */
function doesValidArrayExist(derived) {
    return derived.reduce((acc, x) => acc ^ x, 0) == 0;
}
