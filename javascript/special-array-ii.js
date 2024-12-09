/**
 * @param {number[]} nums
 * @param {number[][]} queries
 * @return {boolean[]}
 */
var isArraySpecial = function(nums, queries) {
    const specials = new Array(nums.length);
    specials[0] = 0;
    for (let i = 1; i < specials.length; i++) {
        if (nums[i - 1] % 2 == nums[i] % 2) {
            specials[i] = specials[i - 1] + 1;
        } else {
            specials[i] = specials[i - 1];
        }
    }
    return queries.map(([from, to]) => specials[from] === specials[to]);
};
