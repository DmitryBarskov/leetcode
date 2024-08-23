def memoize(func)
  memo = {}
  ->(*args) { memo[args] ||= func.(*args) }
end

# @param {String} s
# @return {Integer}
def strange_printer(s)
  recur = memoize(->(i, j) {
    return 0 if i > j

    min = 1 + recur.(i + 1, j)
    (i + 1..j).each do |k|
      next if s[k] != s[i]

      min = [min, recur.(i, k - 1) + recur.(k + 1, j) ].min
    end
    min
  })
  recur.(0, s.length - 1)
end
