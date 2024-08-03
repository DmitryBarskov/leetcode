# @param {Integer[]} rating
# @return {Integer}
def num_teams(rating)
  teams = 0
  (0...rating.size).each do |j|
    less_on_left = (0...j).count { |i| rating[i] < rating[j] }
    greater_on_left = j - less_on_left
    less_on_right = (j + 1...rating.size).count { |k| rating[k] < rating[j] }
    greater_on_right = rating.size - j - 1 - less_on_right

    teams += less_on_left * greater_on_right
    teams += greater_on_left * less_on_right
  end
  teams
end
