# @param {String} s
# @return {Integer}
def minimum_deletions(s)
  bs_on_left = 0
  as_on_right = s.count('a')
  min_deletions = bs_on_left + as_on_right
  s.each_char do |c|
    if c == 'a'
      as_on_right -= 1
    elsif c == 'b'
      bs_on_left += 1
    end
    min_deletions = [min_deletions, bs_on_left + as_on_right].min
  end
  min_deletions
end
