def memoize(func)
  memo = {}
  lambda { |*args| memo[args] ||= func.(*args) }
end

# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  recur = memoize(-> (i1, i2) {
    return word2.length - i2 if i1 >= word1.length
    return word1.length - i1 if i2 >= word2.length

    if word1[i1] == word2[i2]
      recur.(i1 + 1, i2 + 1)
    else
      1 + [
        recur.(i1 + 1, i2),
        recur.(i1, i2 + 1),
        recur.(i1 + 1, i2 + 1)
      ].min
    end
  })
  recur.(0, 0)
end
