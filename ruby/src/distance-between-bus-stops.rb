# @param {Integer[]} distance
# @param {Integer} start
# @param {Integer} destination
# @return {Integer}
def distance_between_bus_stops(distance, start, destination)
  if start > destination
    return distance_between_bus_stops(distance, destination, start)
  end

  clockwise = 0
  counter_clockwise = 0
  distance.each_with_index do |d, i|
    if start <= i && i < destination
      clockwise += d
    else
      counter_clockwise += d
    end
  end

  [clockwise, counter_clockwise].min
end
