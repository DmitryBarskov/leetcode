# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
  required_chars = s1.each_char.tally

  left = 0
  (0...s2.length).each do |right|
    return true if required_chars.empty?

    required_chars[s2[right]] = (required_chars[s2[right]] || 0) - 1
    required_chars.delete(s2[right]) if required_chars[s2[right]].zero?

    while (required_chars[s2[right]] || 0) < 0
      required_chars[s2[left]] = (required_chars[s2[left]] || 0) + 1
      required_chars.delete(s2[left]) if required_chars[s2[left]].zero?
      left += 1
    end
  end
  required_chars.empty?
end
