// https://leetcode.com/problems/132-pattern/description/
// TODO: fix TLE
private class Solution {
  fun find132pattern(nums: IntArray): Boolean {
    val valueToIndex = buildMap<Int, MutableList<Int>> {
      nums.forEachIndexed { index, v ->
        putIfAbsent(v, mutableListOf())
        get(v)!!.add(index)
      }
    }.toSortedMap()

    val values = valueToIndex.keys.toList()
    for (js in 0..values.lastIndex) {
      for (j in valueToIndex[values[js]]!!) {
        var iFound = false
        for (i in 0..<j) {
          if (valueToIndex[values[i]]!!.filter { it < j } != null) {
            iFound = true
            break
          }
        }
        if (!iFound) {
          break
        }

        for (k in 0..<j) {
          if (valueToIndex[values[k]]!!.find { it > j } != null) {
            return true
          }
        }
      }
    }

    return false
  }
}

// 3:0 1:1 4:2 2:3 <- values mapped to their indices
// 1:1 2:3 3:0 4:2 <- sorted by value
//     ^
// searching for k: find one value on the right that is less by index,
//                  then find one value on the left that is less by index than
//                  found index on previous step
// searching for j: find two values on the left one with greater index
//                                          and one with less index

fun main() {
  Solution().apply {
    // println(find132pattern(intArrayOf(1,2,3,4)))
    // println(find132pattern(intArrayOf(3,1,4,2)))
    // println(find132pattern(intArrayOf(-1,3,2,0)))
    println(find132pattern(intArrayOf(1,0,1,-4,-3)))
    // -4:3 -3:4 0:1 1:0,2
    //
  }
}

main()
