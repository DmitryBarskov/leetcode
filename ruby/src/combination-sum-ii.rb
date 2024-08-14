def memoize(func)
  @memo = {}
  ->(*args) { @memo[args] ||= func.(*args) }
end

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  recur = memoize(->(i, left) {
    return [] if left.negative?
    return [[]] if left.zero?
    return [] if i >= candidates.size

    skip = recur.(i + 1, left)
    take = recur.(i + 1, left - candidates[i]).map { _1 + [candidates[i]] }
    (skip + take).uniq
  })
  candidates.sort! { |a, b| b <=> a }
  recur.(0, target)
end
