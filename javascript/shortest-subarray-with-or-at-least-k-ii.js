/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
function minimumSubarrayLength(nums, k) {
    const bitArray = new Array(32).fill(0);
    bitArray.value = 0;
    let l = 0;
    let shortestSpecial = Infinity;
    for (let r = 0; r < nums.length; r++) {
        bitArrayAdd(bitArray, nums[r]);
        while (l <= r && bitArray.value >= k) {
            shortestSpecial = Math.min(r - l + 1, shortestSpecial);
            bitArraySubtract(bitArray, nums[l]);
            l++;
        }
    }
    return shortestSpecial === Infinity ? -1 : shortestSpecial;
}

function bitArrayAdd(bitArray, number) {
    bitArray.value |= number;
    for (let i = 0; i < bitArray.length && number > 0; i++) {
        bitArray[i] += (number & 1);
        number >>= 1;
    }
}

function bitArraySubtract(bitArray, number) {
    let value = bitArray.value;
    for (let i = 0; i < bitArray.length && number > 0; i++) {
        bitArray[i] -= (number & 1);
        if (bitArray[i] == 0) {
            value &= ~(1 << i);
        }
        number >>= 1;
    }
    bitArray.value = value;
}
