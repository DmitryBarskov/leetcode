# frozen_string_literal: true

# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def relative_sort_array(arr1, arr2)
  rank = arr2.each_with_index.to_h { [_1, _2] }
  arr1.sort_by { rank[_1] || (_1 + arr2.size) }
end

relative_sort_array([2,3,1,3,2,4,6,7,9,2,19], [2,1,4,3,9,6]) => [2,2,2,1,4,3,3,9,6,7,19]
relative_sort_array([28,6,22,8,44,17], [22,28,8,6]) => [22,28,8,6,17,44]
