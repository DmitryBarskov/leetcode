# frozen_string_literal: true

# @param {Integer[]} hand
# @param {Integer} group_size
# @return {Boolean}
def is_n_straight_hand(hand, group_size)
  cnt = hand.tally
  keys = cnt.keys.sort.reverse
  while cnt.size.positive?
    keys.pop while cnt[keys.last].nil?
    cons = keys.last
    group_size.times do
      return false unless cnt[cons]

      cnt[cons] -= 1
      cnt.delete(cons) if cnt[cons] <= 0
      cons += 1
    end
  end
  true
end

is_n_straight_hand([1,2,3,6,2,3,4,7,8], 3) => true
is_n_straight_hand([1,2,3,4,5], 4) => false
is_n_straight_hand([2,3,4,5,6,7,8,9], 8) => true
is_n_straight_hand([8,8,9,7,7,7,6,7,10,6], 2) => true
is_n_straight_hand(
  [66,75,4,37,92,87,68,65,58,100,97,42,19,66,73,1,5,44,30,29,76,31,12,35,26,93,9,36,90,16,86,15,4,9,13,98,10,14,18,90,89,
   3,10,65,24,31,43,25,54,55,54,81,10,80,31,12,15,14,59,27,64,93,32,26,69,79,13,32,29,24,27,91,92,82,37,101,100,61,74,30,91,62,36,92,28,23,4,63,55,3,11,11,101,22,34,25,2,75,43,72], 2
) => true
is_n_straight_hand([1,1,2,2,3,3], 2) => false
is_n_straight_hand(Array.new(10_000) { rand(1..1_000_000_000) }, 100)
