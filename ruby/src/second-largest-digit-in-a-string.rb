# frozen_string_literal: true

# @param {String} s
# @return {Integer}
def second_highest(s)
  first_largest = nil
  second_largest = nil
  s.each_char do |char|
    next unless char.between?('0', '9')

    if first_largest.nil? || char > first_largest
      second_largest = first_largest
      first_largest = char
    elsif first_largest != char && (second_largest.nil? || char > second_largest)
      second_largest = char
    end
  end
  second_largest&.to_i || -1
end
