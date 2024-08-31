/**
 * @param {number[]} nums
 * @return {number[][]}
 */
function threeSum(nums) {
    nums.sort((a, b) => a - b);
    const answer = [];
    for (let i = 0; i < nums.length; i++) {
        if (i > 0 && nums[i] === nums[i - 1]) {
            continue;
        }
        twoSum(nums, -nums[i], i + 1, (j, k) => {
            answer.push([nums[i], nums[j], nums[k]]);
        });
    }
    return answer;
}

function twoSum(array, target, from, callback) {
    let l = from;
    let r = array.length - 1;
    while (l < r) {
        while (l > from && array[l] == array[l - 1] && l < r) {
            l++;
        }
        if (l >= r) { break; }
        let sum = array[l] + array[r];
        if (sum < target) {
            l++;
        } else if (sum > target) {
            r--;
        } else {
            callback(l, r);
            l++;
            r--;
        }
    }
}
