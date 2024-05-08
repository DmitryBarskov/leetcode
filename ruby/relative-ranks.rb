# @param {Integer[]} score
# @return {String[]}
def find_relative_ranks(score)
  result = Array.new(score.length)
  score.each_with_index.sort { _2 <=> _1 }.map { _2 }.each_with_index do |idx, rank|
    result[idx] =
      case rank
      when 0 then "Gold Medal"
      when 1 then "Silver Medal"
      when 2 then "Bronze Medal"
      else (rank + 1).to_s
      end
  end

  result
end
