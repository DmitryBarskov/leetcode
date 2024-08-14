# @param {Integer} num
# @return {String}
# 2_147_483_647 => Two Billion One Hundrend Forty Seven Million
# Four Hundred Eighty Three Thousand Six Hundred Fourty Seven
def number_to_words(num)
  return "Zero" if num.zero?

  { Billion: 10**9, Million: 10**6, Thousand: 10**3, "": 1 }
    .transform_values { num / _1 % 1000 }
    .filter_map do |word, number|
      next if number.zero?

      [small_number_to_words(number), word]
    end
    .join(" ")
    .strip
end

BASIC = {
  0 => "", 1 => "One", 2 => "Two", 3 => "Three", 4 => "Four", 5 => "Five",
  6 => "Six", 7 => "Seven", 8 => "Eight", 9 => "Nine", 10 => "Ten",
  11 => "Eleven", 12 => "Twelve", 13 => "Thirteen", 14 => "Fourteen",
  15 => "Fifteen", 16 => "Sixteen", 17 => "Seventeen", 18 => "Eighteen",
  19 => "Nineteen", 20 => "Twenty", 30 => "Thirty", 40 => "Forty",
  50 => "Fifty", 60 => "Sixty", 70 => "Seventy", 80 => "Eighty", 90 => "Ninety",
}.freeze

def small_number_to_words(num)
  case num
  when BASIC.to_proc then BASIC[num]
  when 20..99
    [BASIC[num - (num % 10)], BASIC[num % 10]].join(" ").strip
  when 100..999
    [
      BASIC[num / 100], "Hundred",
      small_number_to_words(num % 100)
    ].join(" ").strip
  end
end
