# @param {String} s
# @return {Integer}
def minimum_chairs(s)
  people_in_room = 0
  required_chairs = 0
  s.each_char do |action|
    if action == 'E'
      people_in_room += 1
      if required_chairs < people_in_room
        required_chairs = people_in_room
      end
    elsif action == 'L'
      people_in_room -= 1
    end
  end
  required_chairs
end
