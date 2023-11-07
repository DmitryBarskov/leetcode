# @leetup=custom
# @leetup=info id=1845 lang=ruby slug=seat-reservation-manager

# Design a system that manages the reservation state of `n` seats that are
# numbered from `1` to `n`.
#
# Implement the `SeatManager` class:
#
# * `SeatManager(int n)` Initializes a `SeatManager` object that will manage `n`
#   seats numbered from `1` to `n`. All seats are initially available.
# * `int reserve()` Fetches the smallest-numbered unreserved seat, reserves
#   it, and returns its number.
# * `void unreserve(int seatNumber)` Unreserves the seat with the given
#   `seatNumber`.
#
#
# Example 1:
#
# Input
# ["SeatManager", "reserve", "reserve", "unreserve", "reserve", "reserve", "reserv
# e", "reserve", "unreserve"]
# [[5], [], [], [2], [], [], [], [], [5]]
# Output
# [null, 1, 2, null, 2, 3, 4, 5, null]
#
# Explanation
# SeatManager seat_manager = new SeatManager(5); // Initializes a SeatManager with
# 5 seats.
# seat_manager.reserve();    // All seats are available, so return the lowest numbe
# red seat, which is 1.
# seat_manager.reserve();    // The available seats are [2,3,4,5], so return the lo
# west of them, which is 2.
# seat_manager.unreserve(2); // Unreserve seat 2, so now the available seats are [2
# ,3,4,5].
# seat_manager.reserve();    // The available seats are [2,3,4,5], so return the lo
# west of them, which is 2.
# seat_manager.reserve();    // The available seats are [3,4,5], so return the lowe
# st of them, which is 3.
# seat_manager.reserve();    // The available seats are [4,5], so return the lowest
#  of them, which is 4.
# seat_manager.reserve();    // The only available seat is seat 5, so return 5.
# seat_manager.unreserve(5); // Unreserve seat 5, so now the available seats are [5
# ].
#
#
# Constraints:
#
# * `1 <= n <= 105`
# * `1 <= seatNumber <= n`
# * For each call to `reserve`, it is guaranteed that there will be at least one
#   unreserved seat.
# * For each call to `unreserve`, it is guaranteed that `seatNumber` will be
#   reserved.
# * At most `105` calls in total will be made to `reserve` and `unreserve`.
#

# @leetup=custom
# @leetup=code
class BinaryHeap
  def initialize
    @array = []
  end

  def extract_min!
    min.tap do
      @array[0] = @array.pop
      sift_down!(0)
    end
  end

  def heap_size = @array.size

  def min = @array.first

  def insert!(value)
    @array.push(value)
    sift_up!(heap_size - 1)
  end

  private

  def sift_up!(i)
    while @array[i] < @array[(i - 1).to_f./(2).to_i]
      swap!(i, (i - 1) / 2)
      i = (i - 1) / 2
    end
  end

  def sift_down!(i)
    while 2 * i + 1 < heap_size
      left = 2 * i + 1
      right = 2 * i + 2
      j = left

      j = right if right < heap_size && @array[right] < @array[left]

      break if @array[i] <= @array[j]

      swap!(i, j)
      i = j
    end
  end

  def swap!(ind1, ind2)
    @array[ind1], @array[ind2] = @array[ind2], @array[ind1]
  end
end

class SeatManager
  # :type n: Integer
  def initialize(n)
    @seats = n
    @available = BinaryHeap.new.tap do |heap|
      (1..n).each { |seat| heap.insert!(seat) }
    end
  end

  # :rtype: Integer
  def reserve
    @available.extract_min!
  end

  # :type seat_number: Integer
  # :rtype: Void
  def unreserve(seat_number)
    @available.insert!(seat_number)
  end
end

# Your SeatManager object will be instantiated and called as such:
# obj = SeatManager.new(n)
# param_1 = obj.reserve()
# obj.unreserve(seat_number)
# @leetup=code

seat_manager = SeatManager.new(5) # Initializes a SeatManager with 5 seats.
seat_manager.reserve => 1 # All seats are available, so return the lowest numbered seat, which is 1.
seat_manager.reserve => 2 # The available seats are [2,3,4,5], so return the lowest of them, which is 2.
seat_manager.unreserve(2) # Unreserve seat 2, so now the available seats are [2,3,4,5].
seat_manager.reserve => 2 # The available seats are [2,3,4,5], so return the lowest of them, which is 2.
seat_manager.reserve => 3 # The available seats are [3,4,5], so return the lowest of them, which is 3.
seat_manager.reserve => 4 # The available seats are [4,5], so return the lowest of them, which is 4.
seat_manager.reserve => 5 # The only available seat is seat 5, so return 5.
seat_manager.unreserve(5) # Unreserve seat 5, so now the available seats are [5]
