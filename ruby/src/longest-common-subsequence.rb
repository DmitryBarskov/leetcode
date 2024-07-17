# @param {String} text1
# @param {String} text2
# @return {Integer}
def longest_common_subsequence(text1, text2)
  longest = Array.new(text1.length + 1) { Array.new(text2.length + 1, 0) }

  (0...text1.length).each do |i|
    c1 = text1[i]
    (0...text2.length).each do |j|
      c2 = text2[j]
      if c1 == c2
        longest[i + 1][j + 1] = 1 + longest[i][j]
      else
        longest[i + 1][j + 1] = [longest[i][j + 1], longest[i + 1][j]].max
      end
    end
  end

  longest.last.last
end
