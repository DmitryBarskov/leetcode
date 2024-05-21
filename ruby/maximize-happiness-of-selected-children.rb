# @param {Integer[]} happiness
# @param {Integer} k
# @return {Integer}
def maximum_happiness_sum(happiness, k)
  happiness.sort { _2 <=> _1 }.each_with_index.reduce(0) do |sum, (h, i)|
    next sum if i >= k

    sum + [h - i, 0].max
  end
end
