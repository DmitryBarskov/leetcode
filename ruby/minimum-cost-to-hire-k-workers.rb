class PriorityQueue
  def initialize(&compare_fn)
    @compare_fn = compare_fn || lambda { |x, y| x <=> y }
    @array = []
  end

  def offer(item)
    @array.push(item)
    sift_up(size - 1)
  end

  def poll
    result = @array.first
    @array[0] = @array.last
    @array.pop
    sift_down(0)
    result
  end

  def to_a(&block)
    @array.map(&block)
  end

  def size
    @array.size
  end

  private

  def sift_up(from)
    i = from
    while i > 0 && cmp(i, (i - 1) / 2) < 0
      swap(i, (i - 1) / 2)
      i = (i - 1) / 2
    end
  end

  def sift_down(from)
    i = from
    while 2 * i + 1 < size
      left = 2 * i + 1
      right = 2 * i + 2

      j = left
      if right < size && cmp(right, left) < 0
        j = right
      end
      if cmp(i, j) <= 0
        break
      end
      swap(i, j)
      i = j
    end
  end

  def cmp(i, j)
    @compare_fn.call(@array[i], @array[j])
  end

  def swap(i, j)
    @array[i], @array[j] = @array[j], @array[i]
  end
end


class BinaryHeap
  def initialize(&compare_fn)
    @compare_fn = compare_fn || lambda { |x, y| x <=> y }
    @array = []
  end

  def push(item)
    @array.push(item)
    sift_up(size - 1)
  end

  def pop
    result = @array[0]
    @array[0] = @array.last
    @array.pop
    sift_down(0)
    result
  end

  def size
    @array.size
  end

  private

  def sift_up(from)
    i = from
    while i > 0
      parent = (i - 1) / 2
      break if compare(i, parent) >= 0

      swap(i, parent)
      i = parent
    end
  end

  def sift_down(from)
    i = from
    while 2 * i + 1 < @array.size
      left = 2 * i + 1
      right = 2 * i + 2

      j = left
      if right < @array.size && compare(right, left) <= 0
        j = right
      end
      if compare(i, j) < 0
        break
      end
      swap(i, j)
      i = j
    end
  end

  def swap(i, j)
    @array[i], @array[j] = @array[j], @array[i]
  end

  def compare(i, j)
    @compare_fn.call(@array[i], @array[j])
  end
end

# @param {Integer[]} quality
# @param {Integer[]} wage
# @param {Integer} k
# @return {Float}
def mincost_to_hire_workers(quality, wage, k)
  workers = quality.size.times.to_a
  rate = proc { |w| wage[id].to_f / quality[id] }
  workers.sort_by! { |id| rate[w] }

  heap = BinaryHeap.new { |w1, w2| -(rate[w1] <=> rate[w2]) }
  res = Float::INFINITY
  total_quality = 0

  workers.each do |w|
    heap.push(w)
    total_quality += quality[w]

    if heap.size > k
      total_quality -= rate[heap.pop]
    end

    if heap.size == k
      res = [res, total_quality * rate[w]].min
    end
  end
  res
end
