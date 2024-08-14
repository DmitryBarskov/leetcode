class DetectSquares
  def initialize()
    # @points[x][y] = number of points added to (x, y)
    @points = {}
    # @by[x] = points added with given x
    @by_x = {}
  end

  # :type point: Integer[]
  # :rtype: Void
  def add(point)
    @points[point[0]] ||= Hash.new(0)
    @points[point[0]][point[1]] += 1
    @by_x[point[0]] ||= []
    @by_x[point[0]].append(point)
  end

  # :type point: Integer[]
  # :rtype: Integer
  def count(point)
    x = point[0]
    @by_x[x] ||= []
    @by_x[x].sum do |second_point|
      # this will create a square with 0 area, so we skip it
      next 0 if second_point[1] == point[1]

      side = (point[1] - second_point[1]).abs
      @points[x + side] ||= Hash.new(0)
      @points[x - side] ||= Hash.new(0)
      @points[x + side][point[1]] * @points[x + side][second_point[1]] + \
        @points[x - side][point[1]] * @points[x - side][second_point[1]]
    end
  end
end

# Your DetectSquares object will be instantiated and called as such:
detectSquares = DetectSquares.new()
detectSquares.add([3, 10]);
detectSquares.add([11, 2]);
detectSquares.add([3, 2]);
detectSquares.count([11, 10]) => 1

detectSquares.count([14, 8]) => 0
detectSquares.add([11, 2]);
detectSquares.count([11, 10]) => 2
