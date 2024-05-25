class String
  def palindrome?
    self == reverse
  end
end

# @param {String} s
# @return {String[][]}
def partition(s, i = 0, last_word = "")
  if i >= s.length
    return [[]] if last_word.empty?
    return [[last_word]] if last_word.palindrome?
    return []
  end
  return partition(s, i + 1, s[i]) if last_word.empty?

  if last_word.palindrome?
    partition(s, i, "").map { |p| [last_word] + p } +
      partition(s, i + 1, last_word + s[i])
  else
    partition(s, i + 1, last_word + s[i])
  end
end
