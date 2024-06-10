# @param {Integer[]} heights
# @return {Integer}
def height_checker(heights)
  heights.sort.zip(heights).count { _1 != _2 }
end
