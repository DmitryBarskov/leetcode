# @param {String} s
# @param {String} t
# @return {Integer}
def append_characters(s, t)
  ti = 0
  s.each_char do |c|
    ti += 1 if ti < t.length && c == t[ti]
  end
  t.length - ti
end

append_characters("coaching", "coding") => 4
append_characters("abcde", "a") => 0
append_characters("z", "abcde") => 5
