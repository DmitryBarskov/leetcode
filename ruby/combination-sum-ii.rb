# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  candidates.sort!
  recur = lambda do |left, start = 0, terms = [], result = []|
    return result.push(terms.dup) if left.zero?
    return result if left.negative? || start >= candidates.size
   
    (start...candidates.size).each do |next_i|
      next_item = candidates[next_i]
      next if next_i > start && next_item == candidates[next_i - 1]
      
      terms.push(next_item)
      recur.(left - next_item, next_i + 1, terms, result)
      terms.pop
    end
    result
  end
  recur.(target)
end
