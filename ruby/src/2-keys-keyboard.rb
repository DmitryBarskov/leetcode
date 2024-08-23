# @param {Integer} n
# @return {Integer}
def min_steps(n)
  min_op = Array.new(n + 1)
  min_op[1] = 0
  (1..n).each do |i|
    chars = i
    ops = min_op[chars]
    ops += 1 # copy
    while chars <= n
      ops += 1 # paste
      chars += i
      if min_op[chars].nil? || ops < min_op[chars]
        min_op[chars] = ops
      end
    end
  end
  min_op[n]
end
