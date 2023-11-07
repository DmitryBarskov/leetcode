# @leetup=custom
# @leetup=info id=1535 lang=ruby slug=find-the-winner-of-an-array-game


# Given an integer array `arr` of distinct integers and an integer `k`.
# 
# A game will be played between the first two elements of the array (i.e. `arr[0]`
# and `arr[1]`). In each round of the game, we compare `arr[0]` with `arr[1]`, the
# larger integer wins and remains at position `0`, and the smaller integer moves
# to the end of the array. The game ends when an integer wins `k` consecutive
# rounds.
# 
# Return *the integer which will win the game*.
# 
# It is guaranteed that there will be a winner of the game.
# 
# 
# Example 1:
# 
# Input: arr = [2,1,3,5,4,6,7], k = 2
# Output: 5
# Explanation: Let's see the rounds of the game:
# Round |       arr       | winner | win_count
#   1   | [2,1,3,5,4,6,7] | 2      | 1
#   2   | [2,3,5,4,6,7,1] | 3      | 1
#   3   | [3,5,4,6,7,1,2] | 5      | 1
#   4   | [5,4,6,7,1,2,3] | 5      | 2
# So we can see that 4 rounds will be played and 5 is the winner because it wins 2
#  consecutive games.
# 
# Example 2:
# 
# Input: arr = [3,2,1], k = 10
# Output: 3
# Explanation: 3 will win the first 10 rounds consecutively.
# 
# 
# Constraints:
# 
# * `2 <= arr.length <= 105`
# * `1 <= arr[i] <= 106`
# * `arr` contains distinct integers.
# * `1 <= k <= 109`
# 
# [2,1,3,5,4,6,7] tick:
# [2,1,3,5,4,6,7] push 1
# [2,1,3,5,4,6,7,1] [1]=2
# [2,2,3,5,4,6,7,1] shift
#   [2,3,5,4,6,7,1]

# @leetup=custom
# @leetup=code
class Slice
  def initialize(array)
    @array = array
    @start = 0
  end

  def [](ind)
    return @array[ind] if ind.negative?

    @array[ind + @start]
  end

  def []=(ind, val)
    @array[ind + @start] = val
  end

  def push(val) = @array.push(val)

  def shift = @start += 1

  def max = [@array[@start], @array[@start + 1]].max

  def min = [@array[@start], @array[@start + 1]].min
end

# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def get_winner(arr, k)
  return arr.max if k >= arr.size

  slice = Slice.new(arr)
  winner = nil
  begin
    a, b = arr
    if winner == slice.max
      streak += 1
    else
      winner = slice.max
      streak = 1
    end
    slice.push(slice.min)
    slice[1] = winner
    slice.shift
  end while streak < k
  winner
end
# @leetup=code

get_winner([1,11,22,33,44,55,66,77,88,99], 1000000000) => 99
