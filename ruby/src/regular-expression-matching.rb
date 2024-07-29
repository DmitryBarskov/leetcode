def memoize(func)
  @memo = {}
  ->(*args) { @memo.fetch(args) { @memo[args] = func.(*args) } }
end

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  p = parse_regex(p)
  recur = memoize(-> (i, j) {
    return true if i >= s.length && j >= p.length
    return empty_regex?(p, j) if i >= s.length
    return false if j >= p.length

    if p[j].end_with?('*') && single_match?(s[i], p[j])
      recur.(i + 1, j + 1) || recur.(i + 1, j) || recur.(i, j + 1)
    elsif p[j].end_with?('*')
      recur.(i, j + 1)
    elsif single_match?(s[i], p[j])
      recur.(i + 1, j + 1)
    else
      false
    end
  })
  recur.(0, 0)
end

def parse_regex(str)
  str.each_char.each_with_object([]) do |char, parsed|
    if char == '*'
      parsed.last.concat('*') unless parsed.last.end_with?('*')
    else
      parsed.push(char)
    end
  end
end

def empty_regex?(regex, start_at) = (start_at...regex.size).all? { |i| regex[i].end_with?('*') }
def single_match?(text, pattern) = pattern.start_with?('.') || pattern.start_with?(text)

is_match("aa","a") => false
is_match("aa", "a*") => true
is_match("ab", ".*") => true
