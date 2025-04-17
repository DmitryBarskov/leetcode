class Solution {
    fun countValidWords(sentence: String): Int =
        sentence.split(" ").count { !it.isEmpty() && isValidWord(it) }

    val punctuation = setOf(',', '.', '!')

    enum class State(val isSuccessful: Boolean = false) {
        BEGIN, PART_ONE(true), PART_HYPHEN, PART_TWO(true), END(true), FAIL
    }

    fun isValidWord(word: String): Boolean =
        word.fold(State.BEGIN) { state, char ->
            when (state) {
                State.FAIL -> State.FAIL
                State.END -> State.FAIL
                State.BEGIN -> when (char) {
                    '-' -> State.FAIL
                    in 'a'..'z' -> State.PART_ONE
                    in punctuation -> State.END
                    else -> State.FAIL
                }
                State.PART_ONE -> when (char) {
                    '-' -> State.PART_HYPHEN
                    in 'a'..'z' -> State.PART_ONE
                    in punctuation -> State.END
                    else -> State.FAIL
                }
                State.PART_HYPHEN -> when (char) {
                    in 'a'..'z' -> State.PART_TWO
                    else -> State.FAIL
                }
                State.PART_TWO -> when (char) {
                    in 'a'..'z' -> State.PART_TWO
                    in punctuation -> State.END
                    else -> State.FAIL
                }
            }
        }.isSuccessful
}
