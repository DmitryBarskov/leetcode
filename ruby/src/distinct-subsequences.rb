def memoize(func)
  memo = {}
  lambda { |*args| memo[args] ||= func.(*args) }
end

# @param {String} s
# @param {String} t
# @return {Integer}
def num_distinct(s, t)
  recur = memoize(->(i, j) {
    return 1 if j >= t.length
    return 0 if i >= s.length
    
    if s[i] == t[j]
      recur.(i + 1, j + 1) + recur.(i + 1, j)
    else
      recur.(i + 1, j)
    end
  })
  recur.(0, 0)
end
