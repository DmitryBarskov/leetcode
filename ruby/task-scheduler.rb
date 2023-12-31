# @leetup=custom
# @leetup=info id=621 lang=ruby slug=task-scheduler

# Given a characters array `tasks`, representing the tasks a CPU needs to do,
# where each letter represents a different task. Tasks could be done in any order.
# Each task is done in one unit of time. For each unit of time, the CPU could
# complete either one task or just be idle.
#
# However, there is a non-negative integer `n` that represents the cooldown period
# between two same tasks (the same letter in the array), that is that there must
# be at least `n` units of time between any two same tasks.
#
# Return *the least number of units of times that the CPU will take to finish all
# the given tasks*.
#
#
# Example 1:
#
# Input: tasks = ["A","A","A","B","B","B"], n = 2
# Output: 8
# Explanation:
# A -> B -> idle -> A -> B -> idle -> A -> B
# There is at least 2 units of time between any two same tasks.
#
# Example 2:
#
# Input: tasks = ["A","A","A","B","B","B"], n = 0
# Output: 6
# Explanation: On this case any permutation of size 6 would work since n = 0.
# ["A","A","A","B","B","B"]
# ["A","B","A","B","A","B"]
# ["B","B","B","A","A","A"]
# ...
# And so on.
#
# Example 3:
#
# Input: tasks = ["A","A","A","A","A","A","B","C","D","E","F","G"], n = 2
# Output: 16
# Explanation:
# One possible solution is
# A -> B -> C -> A -> D -> E -> A -> F -> G -> A -> idle -> idle -> A -> idle -> i
# dle -> A
#
#
# Constraints:
#
# * `1 <= task.length <= 104`
# * `tasks[i]` is upper-case English letter.
# * The integer `n` is in the range `[0, 100]`.
#

# @leetup=custom
# @leetup=code
class Heap
  def initialize(&compare_fn)
    @compare_fn = compare_fn
    @array = []
  end

  def push(item)
    @array.push(item)
    sift_up(size - 1)
  end

  def pop
    return @array.pop if size <= 1

    popped = @array[0]
    @array[0] = @array.pop
    sift_down(0)
    popped
  end

  def size = @array.size

  private

  def sift_down(from)
    current = from
    while 2 * current + 1 < size
      left = 2 * current + 1
      right = 2 * current + 2
      if right < size && compare_at(right, left) < 0
        swap_at(current, right)
        current = right
      elsif compare_at(current, left)
        swap_at(current, left)
        current = left
      end
    end
  end

  def sift_up(from)
    current = from
    while current > 0
      parent = (current - 1) / 2

      if compare_at(current, parent) > 0
        break
      else
        swap_at(current, parent)
        current = parent
      end
    end
  end

  def compare_at(i, j)
    @compare_fn.call(@array[i], @array[j])
  end

  def swap_at(i, j)
    @array[i], @array[j] = @array[j], @array[i]
  end
end

# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
  tasks_count = tasks.group_by(&:itself).map { {name: _1, count: _2.length} }

  queue = Heap.new { |a, b| b[:count] <=> a[:count] }
  tasks_count.each { |task| queue.push(task) }
  cooldown = []
  ticks = 0
  while queue.size > 0 || cooldown.size > 0
    cooldown.each { _1[:ready_in] -= 1 }
    ready, cooldown = cooldown.partition { _1[:ready_in] <= 0 }
    ready.each { |task| queue.push(task[:task]) }

    task = queue.pop
    if task
      task[:count] -= 1

      cooldown.push(task: task, ready_in: n + 1) if task[:count] > 0
    end
    ticks += 1
  end
  ticks
end
# @leetup=code
# @leetup=custom
least_interval(["A", "A", "A", "B", "B", "B"], 0) => 6
least_interval(["A", "A", "A", "B", "B", "B"], 1) => 6
least_interval(["A", "A", "A", "B", "B", "B"], 2) => 8
least_interval(["A", "A", "A", "A", "A", "A", "B", "C", "D", "E", "F", "G"], 2) => 16
least_interval(["A", "A", "A", "B", "B", "B", "C", "C", "C", "D", "D", "E"], 2) => 12
# @leetup=custom
