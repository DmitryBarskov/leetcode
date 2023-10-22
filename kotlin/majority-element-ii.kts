// https://leetcode.com/problems/majority-element-ii
// TODO:
class Solution {
    fun majorityElement(nums: IntArray): List<Int> {
        if (nums.size < 3) return nums.toSet().toList()


    }
}

fun correctSolution(nums: IntArray): List<Int> {
    val count = mutableMapOf<Int, Int>()
    nums.forEach {
        count.compute(it) { _, v -> (v ?: 0) + 1 }
    }

    return count.filter { it.value > nums.size / 3 }.map { it.key }
}

object Test {
    operator fun get(vararg arr: Int) {
        val expected = correctSolution(arr)
        val actual = Solution().majorityElement(arr)
        if (actual == expected) {
            println("✅ ${arr.toList()} -> $actual")
        } else {
            println("❌ ${arr.toList()} -> $actual, but expected $expected")
        }
    }
}

fun main() {
    Test[1]
    Test[1, 2]
    Test[2, 2]
    Test[3, 2, 3]
    Test[1, 2, 3, 1, 2, 3, 1, 2]
    Test[4, 1, 2, 3, 4, 4, 3, 2, 1, 4]
    Test[3, 3, 1, 1, 1, 1, 2, 4, 4, 3, 3, 3, 4, 4]
    Test[1, 3, 3, 2, 2, 4, 3, 3, 5, 5, 6, 3, 3, 7, 7]
}

main()
