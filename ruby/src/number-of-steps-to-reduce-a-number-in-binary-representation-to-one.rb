# @param {String} s
# @return {Integer}
def num_steps(s)
  def recursive(chars)
    return 0 if chars == ["1"]
    return recursive(chars.tap(&:pop)) + 1 if chars.last == "0"

    ones = 0
    while chars.last == "1"
      ones += 1
      chars.pop
    end
    if chars.any?
      chars.pop
    end
    chars.push("1")
    recursive(chars) + ones + 1
  end

  recursive(s.chars)
end


num_steps("1") => 0
num_steps("10") => 1
num_steps("100") => 2
num_steps("11") => 3
num_steps("111") => 4
num_steps("110") => 4
num_steps("1111") => 5
num_steps("1110") => 5
num_steps("1100") => 5 # 1100 -> 110 -> 11 -> 100 -> 10 -> 1
num_steps("1011") => 6 # 1011 -> 1100 -> 110 -> 11 -> 100 -> 10 -> 1
num_steps("1101") => 6 # 1101 -> 1110 -> 111 -> 1000 -> 100 -> 10 -> 1
