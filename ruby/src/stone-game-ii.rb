def memoize(func)
  memo = {}
  ->(*args) { memo[args] ||= func.(*args) }
end

# @param {Integer[]} piles
# @return {Integer}
def stone_game_ii(piles)
  recur = memoize(->(i, m, alice_plays) {
    return 0 if i >= piles.size

    total_taken = nil
    taken_this_turn = 0
    (1..2 * m).each do |x|
      break if i + x > piles.size

      taken_this_turn += piles[i + x - 1]

      taken_next_turns = recur.(i + x, [m, x].max, !alice_plays)

      if alice_plays
        total_taken = [total_taken, taken_this_turn + taken_next_turns].compact.max
      else
        total_taken = [total_taken, taken_next_turns].compact.min
      end
    end

    total_taken
  })
  recur.(0, 1, true)
end
