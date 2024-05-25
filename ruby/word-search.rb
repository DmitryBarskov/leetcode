# frozen_string_literal: true

def recur(i, j, k, board, word)
  return true if k >= word.length
  return false if i < 0 || i >= board.size
  return false if j < 0 || j >= board[i].size
  return false unless board[i][j] == word[k]

  val = board[i][j]
  board[i][j] = '.'
  result =
    recur(i, j - 1, k + 1, board, word) ||
    recur(i, j + 1, k + 1, board, word) ||
    recur(i - 1, j, k + 1, board, word) ||
    recur(i + 1, j, k + 1, board, word)
  board[i][j] = val

  result
end

# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  chars_count = word.each_char.group_by(&:itself).to_h { |k, v| [k, v.count] }
  word.reverse! if chars_count[word[0]] > chars_count[word[-1]]
  (0...board.size).any? do |i|
    (0...board[i].size).any? { |j| recur(i, j, 0, board, word) }
  end
end

require_relative 'lib/test'
Test.(:exist, <<~INPUT, <<~EXPECTED)
[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
"ABCCED"
[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
"SEE"
[["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
"ABCB"
[["F", "E", "J", "D", "N", "N"], ["N", "U", "A", "Z", "Z", "K"], ["C", "Z", "D", "Q", "J", "D"], ["B", "Q", "L", "S", "W", "W"], ["T", "S", "Q", "Y", "K", "D"], ["J", "F", "Z", "G", "S", "X"]]
"ZDQSYGZFJTBCNUAJ"
[["F", "E", "J", "D", "N", "N"], ["N", "U", "A", "Z", "Z", "K"], ["C", "Z", "D", "Q", "J", "D"], ["B", "Q", "L", "S", "W", "W"], ["T", "S", "Q", "Y", "K", "D"], ["J", "F", "Z", "G", "S", "X"]]
"ZDQSYGZFJTBCNUAU"
[["A"]]
"A"
[["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"]]
"AAAAAAAAAAAAAAB"
[["A","B","C","E"],["S","F","E","S"],["A","D","E","E"]]
"ABCESEEEFS"
INPUT
true
true
false
true
false
true
false
true
EXPECTED
