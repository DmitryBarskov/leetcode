def memoize(func)
  @memo = {}
  lambda do |*args|
    return @memo[args] if @memo.key?(args)
    @memo[args] = func.(*args)
  end
end

# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
  recur = memoize(lambda do |i1, i2|
    i3 = i1 + i2
    return i3 >= s3.length if i1 >= s1.length && i2 >= s2.length
    return s2[i2] == s3[i3] && recur.(i1, i2 + 1) if i1 >= s1.length
    return s1[i1] == s3[i3] && recur.(i1 + 1, i2) if i2 >= s2.length

    if s1[i1] == s2[i2]
      return false if s1[i1] != s3[i3]
      return recur.(i1 + 1, i2) || recur.(i1, i2 + 1)
    end

    return recur.(i1 + 1, i2) if s1[i1] == s3[i3]
    return recur.(i1, i2 + 1) if s2[i2] == s3[i3]
    false
  end)
  recur.(0, 0)
end
