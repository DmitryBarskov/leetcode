# @param {String[]} names
# @param {Integer[]} heights
# @return {String[]}
def sort_people(names, heights)
  for sorted_end in names.size.downto(1) do
    for i in 1...sorted_end do
      if heights[i - 1] < heights[i]
        heights[i - 1], heights[i] = heights[i], heights[i - 1]
        names[i - 1], names[i] = names[i], names[i - 1]
      end
    end
  end
  names
end
