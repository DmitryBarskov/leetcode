// @leetup=custom
// @leetup=info id=17 lang=kotlin slug=letter-combinations-of-a-phone-number

/*
* Given a string containing digits from `2-9` inclusive, return all possible
* letter combinations that the number could represent. Return the answer in any
* order.
*
* A mapping of digits to letters (just like on the telephone buttons) is given
* below. Note that 1 does not map to any letters.
*
*
* Example 1:
*
* Input: digits = "23"
* Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
*
* Example 2:
*
* Input: digits = ""
* Output: []
*
* Example 3:
*
* Input: digits = "2"
* Output: ["a","b","c"]
*
*
* Constraints:
*
* * `0 <= digits.length <= 4`
* * `digits[i]` is a digit in the range `['2', '9']`.
*
*/
// @leetup=custom
// @leetup=code

class Solution {
    val keypad = mapOf(
        '2' to "abc",
        '3' to "def",
        '4' to "ghi",
        '5' to "jkl",
        '6' to "mno",
        '7' to "pqrs",
        '8' to "tuv",
        '9' to "wxyz"
    )
    fun letterCombinations(digits: String): List<String> {
        return digits.reduce { keypad[it]!!.split("") }
    }
}
// @leetup=code

// @leetup=custom
fun main() {
    println(Solution().letterCombinations("23"))
}
main()
// @leetup=custom
