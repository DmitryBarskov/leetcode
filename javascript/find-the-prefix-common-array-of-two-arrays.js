/**
 * output[i] = number of common items in a[0..i] and b[0..i]
 * Input: A = [1,3,2,4], B = [3,1,2,4]
 * Output: [0,2,3,4]
 * @param {number[]} a
 * @param {number[]} b
 * @return {number[]}
 */
function findThePrefixCommonArray(a, b) {
    const common = new Array(a.length);
    const metInOneArray = new Set();
    let metInBothArrays = 0;
    for (let i = 0; i < common.length; i++) {
        if (metInOneArray.has(a[i])) {
            metInOneArray.delete(a[i]);
            metInBothArrays++;
        } else {
            metInOneArray.add(a[i]);
        }
        if (metInOneArray.has(b[i])) {
            metInOneArray.delete(b[i]);
            metInBothArrays++;
        } else {
            metInOneArray.add(b[i]);
        }
        common[i] = metInBothArrays;
    }
    return common;
}
