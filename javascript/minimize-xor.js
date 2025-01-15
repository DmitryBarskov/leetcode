/**
 * Returns X with the same number of set bits as num2,
 * such that X ^ num1 is minimal.
 * @param {number} num1
 * @param {number} num2
 * @return {number}
 */
function minimizeXor(num1, num2) {
    let bitsToSet = countSetBits(num2);
    let result = 0;
    for (let i = bitLength(num1) - 1; i >= 0 && bitsToSet > 0; i--) {
        if (getBit(num1, i) === 0) {
            continue;
        }
        result = setBit(result, i);
        bitsToSet--;
    }
    for (let i = 0; bitsToSet > 0; i++) {
        if (getBit(result, i) === 1) {
            continue;
        }
        result = setBit(result, i);
        bitsToSet--;
    }
    return result;
}

const getBit = (number, index) => (number >> index) & 1;
const setBit = (number, index) => number | (1 << index);

function countSetBits(number) {
    let setBits = 0;
    while (number > 0) {
        setBits += number & 1;
        number >>= 1;
    }
    return setBits;
}

function bitLength(number) {
    let length = 0;
    while (number > 0) {
        number >>= 1;
        length++;
    }
    return length;
}
