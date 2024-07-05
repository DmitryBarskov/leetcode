# frozen_string_literal: true

# @param {Integer[]} seats
# @param {Integer[]} students
# @return {Integer}
def min_moves_to_seat(seats, students)
  seats.sort.zip(students.sort).sum { |seat, student| (seat - student).abs }
end
