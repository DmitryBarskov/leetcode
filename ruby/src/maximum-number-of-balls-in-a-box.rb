# frozen_string_literal: true

# @param {Integer} low_limit
# @param {Integer} high_limit
# @return {Integer}
def count_balls(low_limit, high_limit)
  boxes = []
  max = 0
  (low_limit..high_limit).each do |ball|
    box = ball.digits.sum
    boxes[box] ||= 0
    boxes[box] += 1
    max = [max, boxes[box]].max
  end
  max
end
