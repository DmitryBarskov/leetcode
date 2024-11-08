defmodule Solution do
  @spec is_circular_sentence(sentence :: String.t) :: boolean
  def is_circular_sentence(sentence) do
    char_list = String.graphemes(sentence)
    first_char = hd(char_list)
    recur(first_char, first_char, char_list)
  end

  def recur(first_char, last_word_char, []), do:
    first_char == last_word_char
  def recur(first_char, last_word_char, [" " , first_word_char | cs]), do:
    last_word_char == first_word_char and recur(first_char, first_word_char, cs)
  def recur(first_char, last_word_char, [c | cs]), do:
    recur(first_char, c, cs)
end
