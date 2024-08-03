# @param {Integer} main_tank
# @param {Integer} additional_tank
# @return {Integer}
def distance_traveled(main_tank, additional_tank)
  return main_tank * 10 if main_tank < 5 || additional_tank < 1

  50 + distance_traveled(main_tank - 4, additional_tank - 1)
end
