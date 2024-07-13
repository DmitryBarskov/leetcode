# @param {String} s
# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def maximum_gain(s, x, y)
  if x > y
    no_ab, ab_removed = remove_symbols(s, "a", "b")
    _, ba_removed = remove_symbols(no_ab, "b", "a")
  else
    no_ba, ba_removed = remove_symbols(s, "b", "a")
    _, ab_removed = remove_symbols(no_ba, "a", "b")
  end
  ab_removed * x + ba_removed * y
end

def remove_symbols(str, c1, c2)
  stack = []
  removed = 0
  str.each_char do |char|
    if stack.last == c1 && char == c2
      stack.pop
      removed += 1
    else
      stack.push(char)
    end
  end
  [stack.join, removed]
end
