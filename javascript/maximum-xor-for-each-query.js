/**
 * @param {number[]} nums
 * @param {number} maximumBit
 * @return {number[]}
 */
var getMaximumXor = function(nums, maximumBit) {
    let xor = nums.reduce((a, b) => a ^ b, 0);
    const mask = (1 << maximumBit) - 1;
    const result = [];
    for (let i = nums.length - 1; i >= 0; i--) {
        result.push((xor & mask) ^ mask);
        xor ^= nums[i];
    }
    return result;
};
