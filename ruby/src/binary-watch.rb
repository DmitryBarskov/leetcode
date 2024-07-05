# frozen_string_literal: true

HOURS = (0..11).group_by { |d| d.digits(2).count(1) }
MINUTES = (0..59).group_by { |d| d.digits(2).count(1) }

# @param {Integer} turned_on
# @return {String[]}
def read_binary_watch(turned_on)
  (0..turned_on).flat_map do |turned_on_hours|
    turned_on_minutes = turned_on - turned_on_hours
    HOURS.fetch(turned_on_hours, [])
         .product(MINUTES.fetch(turned_on_minutes, []))
         .map { |h, m| format("%d:%02d", h, m) }
  end
end
