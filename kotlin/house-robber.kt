class Solution {
    tailrec
    fun rob(nums: IntArray, i: Int = 0, max1: Int = 0, max2: Int = 0): Int =
        if (i > nums.lastIndex) Math.max(max1, max2)
        else rob(nums, i + 1, max2, Math.max(max1 + nums[i], max2))
}
