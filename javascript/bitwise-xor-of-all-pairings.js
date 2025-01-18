/**
 * 
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number}
 */
function xorAllNums(nums1, nums2) {
    let xor = 0;
    if (nums2.length % 2 === 1) {
        xor = nums1.reduce((acc, x) => acc ^ x, xor);
    }
    if (nums1.length % 2 === 1) {
        xor = nums2.reduce((acc, x) => acc ^ x, xor);
    }
    return xor;
}
