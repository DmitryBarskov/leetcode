class Solution {
    tailrec
    fun minCostClimbingStairs(cost: IntArray, i: Int = 2, a: Int = cost[0], b: Int = cost[1]): Int =
        if (i > cost.lastIndex) Math.min(a, b)
        else minCostClimbingStairs(cost, i + 1, b, cost[i] + Math.min(a, b))
}
