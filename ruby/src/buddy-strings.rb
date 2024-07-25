# @param {String} s
# @param {String} goal
# @return {Boolean}
def buddy_strings(s, goal)
  return false if s.size != goal.size

  letter_count = s.each_char.tally
  return false if letter_count != goal.each_char.tally

  diffs = 0
  (0...s.size).each do |i|
    if s[i] != goal[i]
      diffs += 1
    end
    return false if diffs > 2
  end
  diffs == 2 || (diffs == 0 && letter_count.any? { _2 >= 2 })
end
