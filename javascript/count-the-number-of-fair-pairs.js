const binarySearch = (array, predicate, from = 0, to = array.length) => {
    let lo = from;
    let hi = to;
    
    while (lo < hi) {
        let mi = Math.floor((lo + hi) / 2);
        if (predicate(array[mi])) {
            hi = mi;
        } else {
            lo = mi + 1;
        }
    }
    return lo;
};

/**
 * @param {number[]} nums
 * @param {number} lower
 * @param {number} upper
 * @return {number}
 */
const countFairPairs = (nums, lower, upper) => {
    nums.sort((a, b) => a - b);
    let pairs = 0;
    for (let i = 0; i < nums.length; i++) {
        let to = binarySearch(nums, (otherNum) => nums[i] + otherNum > upper);
        let from = binarySearch(nums, (otherNum) => nums[i] + otherNum >= lower);
        pairs += to - from;
        if (from <= i && i <= to) {
            pairs -= 1;
        }
    }
    return Math.ceil(pairs / 2);
};
