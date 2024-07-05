# frozen_string_literal: true

# @param {Integer} c
# @return {Boolean}
def judge_square_sum(c)
  Math.sqrt(c).+(1).floor.times do |a|
    b = Math.sqrt(c - (a * a))
    return true if b.to_i == b
  end
  false
end
