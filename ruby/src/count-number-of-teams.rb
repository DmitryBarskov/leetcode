# @param {Integer[]} rating
# @return {Integer}
def num_teams(rating)
  less_on_left = Array.new(rating.size, 0)
  less_on_right = Array.new(rating.size, 0)

  (0...rating.size).each do |j|
    (0...j).each do |i|
      less_on_left[j] += 1 if rating[i] < rating[j]
    end
    (j + 1...rating.size).each do |k|
      less_on_right[j] += 1 if rating[k] < rating[j]
    end
  end

  teams = 0
  (0...rating.size).each do |j|
    greater_on_right = rating.size - j - 1 - less_on_right[j]
    teams += less_on_left[j] * greater_on_right

    greater_on_left = j - less_on_left[j]
    teams += greater_on_left * less_on_right[j]
  end
  teams
end
