# @param {String[]} arr
# @param {Integer} k
# @return {String}
def kth_distinct(arr, k)
  count
    .tally.lazy
    .filter { |str, c| c == 1 }
    .drop(k - 1)
    .first || ""
end
