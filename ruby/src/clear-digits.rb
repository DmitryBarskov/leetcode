# frozen_string_literal: true

# @param {String} s
# @return {String}
def clear_digits(s)
  no_digits = []
  s.each_char do |char|
    if char.between?('0', '9')
      no_digits.pop
    else
      no_digits.push(char)
    end
  end
  no_digits.join
end
