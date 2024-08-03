class Solution {
    tailrec
    fun getSum(a: Int, b: Int): Int = when {
        a == 0 -> b
        b == 0 -> a
        else -> getSum(a xor b, (a and b) shl 1)
    }
}
