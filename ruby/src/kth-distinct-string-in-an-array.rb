# @param {String[]} arr
# @param {Integer} k
# @return {String}
def kth_distinct(arr, k)
  arr.tally.lazy
    .filter_map { _1 if _2 == 1 }
    .drop(k - 1).first || ""
end
