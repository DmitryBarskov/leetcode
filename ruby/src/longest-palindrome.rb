# @param {String} s
# @return {Integer}
def longest_palindrome(s)
  set = Set.new
  length = 0
  s.each_char do |c|
    if set.include?(c)
      set.delete(c)
      length += 2
    else
      set.add(c)
    end
  end
  length + (set.any? ? 1 : 0)
end
