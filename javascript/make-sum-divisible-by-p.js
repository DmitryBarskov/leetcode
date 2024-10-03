/**
 * @param {number[]} nums
 * @param {number} p
 * @return {number}
 */
const minSubarray = (nums, p) => {
    let prefix = scan(nums, nums[0] % p, (a, b) => (a + b) % p);
    const target = prefix[prefix.length - 1];
    if (target === 0) {
        return 0;
    }
    let shortest = nums.length;
    const modIndex = new Map([[0, -1]]);

    for (let i = 0; i < prefix.length; i++) {
        let toRemove = (prefix[i] + p - target) % p;
        if (modIndex.has(toRemove)) {
            shortest = Math.min(shortest, i - modIndex.get(toRemove));
        }
        modIndex.set(prefix[i], i);
    }

    if (shortest == nums.length) {
        return -1;
    }
    return shortest;
};

const scan = (array, init = array[0], func) => {
    let prefix = new Array(array.length);
    prefix[0] = init;
    for (let i = 1; i < prefix.length; i++) {
        prefix[i] = func(prefix[i - 1], array[i]);
    }
    return prefix;
};
