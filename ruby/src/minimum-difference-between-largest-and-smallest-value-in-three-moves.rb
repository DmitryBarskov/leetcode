# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer}
def min_difference(nums)
  return 0 if nums.size <= 4

  mins = [nil, nil, nil, nil]
  maxs = [nil, nil, nil, nil]
  nums.each do |num|
    if mins[0].nil? || num < mins[0]
      mins[3] = mins[2]
      mins[2] = mins[1]
      mins[1] = mins[0]
      mins[0] = num
    elsif mins[1].nil? || num < mins[1]
      mins[0] = mins[0]
      mins[3] = mins[2]
      mins[2] = mins[1]
      mins[1] = num
    elsif mins[2].nil? || num < mins[2]
      mins[0] = mins[0]
      mins[1] = mins[1]
      mins[3] = mins[2]
      mins[2] = num
    elsif mins[3].nil? || num < mins[3]
      mins[0] = mins[0]
      mins[1] = mins[1]
      mins[2] = mins[2]
      mins[3] = num
    end

    if maxs[0].nil? || num > maxs[0]
      maxs[3] = maxs[2]
      maxs[2] = maxs[1]
      maxs[1] = maxs[0]
      maxs[0] = num
    elsif maxs[1].nil? || num > maxs[1]
      maxs[0] = maxs[0]
      maxs[3] = maxs[2]
      maxs[2] = maxs[1]
      maxs[1] = num
    elsif maxs[2].nil? || num > maxs[2]
      maxs[0] = maxs[0]
      maxs[1] = maxs[1]
      maxs[3] = maxs[2]
      maxs[2] = num
    elsif maxs[3].nil? || num > maxs[3]
      maxs[0] = maxs[0]
      maxs[1] = maxs[1]
      maxs[2] = maxs[2]
      maxs[3] = num
    end
  end

  [
    maxs[0] - mins[3],
    maxs[1] - mins[2],
    maxs[2] - mins[1],
    maxs[3] - mins[0]
  ].min
end
