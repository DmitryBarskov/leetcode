# @param {Integer} n
# @param {Integer} time
# @return {Integer}
def pass_the_pillow(n, time)
  person_holding_pillow = 1
  direction = +1
  time.times do
    person_holding_pillow += direction

    if person_holding_pillow == 1 || person_holding_pillow == n
      direction = -direction
    end
  end
  person_holding_pillow
end
