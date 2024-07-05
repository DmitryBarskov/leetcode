# frozen_string_literal: true

# @param {Integer[][]} triplets
# @param {Integer[]} target
# @return {Boolean}
def merge_triplets(triplets, target)
  max = [0, 0, 0]
  triplets.each do |triplet|
    next if triplet[0] > target[0] || triplet[1] > target[1] || triplet[2] > target[2]

    max[0] = triplet[0] if triplet[0] > max[0]
    max[1] = triplet[1] if triplet[1] > max[1]
    max[2] = triplet[2] if triplet[2] > max[2]
  end
  max == target
end
