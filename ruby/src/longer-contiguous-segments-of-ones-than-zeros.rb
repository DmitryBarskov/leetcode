# @param {String} s
# @return {Boolean}
def check_zero_ones(s)
  return s == '1' if s.size == 1
  return s == '11' if s.size == 2

  max_cons_ones = 0
  max_cons_zeroes = 0
  cons = 0
  s.each_char.each_cons(2) do |prev, curr|
    if prev != curr
      cons = 1
    elsif cons.zero? && prev == curr
      cons = 2
    elsif prev == curr
      cons += 1
    end

    if curr == '0'
      max_cons_zeroes = [max_cons_zeroes, cons].max
    elsif curr == '1'
      max_cons_ones = [max_cons_ones, cons].max
    end
  end
  max_cons_ones > max_cons_zeroes
end
