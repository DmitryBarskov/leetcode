# @param {String} s
# @return {Integer}
def count_substrings(s)
  total = 0
  total += (0...s.size).sum { |i| count_palindromes(s, i, i) }
  total += (1...s.size).sum { |i| count_palindromes(s, i - 1, i) }
  total
end

def count_palindromes(s, c1, c2)
  count = 0
  while 0 <= c1 && c2 < s.length && s[c1] == s[c2]
    count += 1
    c1 -= 1
    c2 += 1
  end
  count
end
