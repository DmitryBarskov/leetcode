# frozen_string_literal: true

# @param {String} s
# @return {Boolean}
def check_valid_string(s)
  min_open = 0
  max_open = 0
  s.each_char do |char|
    if char == '('
      min_open += 1
      max_open += 1
    elsif char == ')'
      min_open -= 1
      max_open -= 1
    else
      min_open -= 1
      max_open += 1
    end
    min_open = 0 if min_open.negative?
    return false if max_open.negative?
  end
  0.between?(min_open, max_open)
end
