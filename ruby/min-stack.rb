# frozen_string_literal: true

# https://leetcode.com/problems/min-stack/
class MinStack
  def initialize
    @minimums = []
    @stack = []
  end

  def push(val)
    @minimums.push([@minimums[-1], val].compact.min)
    @stack.push(val)
  end

  def pop
    @minimums.pop
    @stack.pop
  end

  def top
    @stack[-1]
  end

  def get_min
    @minimums[-1]
  end
end

# Your MinStack object will be instantiated and called as such:
# obj = MinStack.new()
# obj.push(val)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.get_min()

min_stack = MinStack.new
min_stack.push(-2)
min_stack.push(0)
min_stack.push(-3)
min_stack.get_min => -3
min_stack.pop
min_stack.top => 0
min_stack.get_min => -2
