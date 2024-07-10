CODES = Set.new((1..26).map(&:to_s))

# @param {String} s
# @return {Integer}
def num_decodings(s)
  two_steps_back = 0
  one_step_back = 1

  (0...s.size).each do |i|
    decodings = 0
    if CODES.include?(s[i])
      decodings += one_step_back
    end
    if i > 0 && CODES.include?(s[i - 1] + s[i])
      decodings += two_steps_back
    end
    two_steps_back, one_step_back = one_step_back, decodings
  end
  one_step_back
end
