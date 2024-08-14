# @param {String} word
# @return {Integer}
def minimum_pushes(word)
  word.each_char
    .tally
    .sort { |a, b| b[1] <=> a[1] }
    .map { |_char, count| count }
    .each_slice(8)
    .with_index(1)
    .sum { |counts, pushes| counts.sum * pushes }
end
