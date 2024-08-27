# @param {Integer} target
# @param {Integer[]} position
# @param {Integer[]} speed
# @return {Integer}
def car_fleet(target, position, speed)
  cars = position.zip(speed)
  cars.sort! { |a, b| b[0] <=> a[0] }
  last_fleet_finish_time = nil
  fleets = 0
  cars.each do |pos, speed|
    finish_time = (target - pos) / speed.to_f
    if last_fleet_finish_time.nil? || finish_time > last_fleet_finish_time
      last_fleet_finish_time = finish_time
      fleets += 1
    end
  end
  fleets
end
