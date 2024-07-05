# frozen_string_literal: true

# @param {Integer[]} arr
# @return {Integer}
def count_triplets(arr)
  prefix_sum = Array.new(arr.size + 1)
  prefix_sum[0] = 0
  (1...prefix_sum.size).each do |i|
    prefix_sum[i] = prefix_sum[i - 1] ^ arr[i - 1]
  end

  triplets = 0
  (0...prefix_sum.size).each do |i|
    (i + 1...prefix_sum.size).each do |j|
      triplets += j - i - 1 if prefix_sum[j] == prefix_sum[i]
    end
  end
  triplets
end
