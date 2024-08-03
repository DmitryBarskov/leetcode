def memoize(func)
  memo = {}
  ->(*args) { memo[args] ||= func.(*args) }
end

# @param {Integer[][]} books
# @param {Integer} shelf_width
# @return {Integer}
def min_height_shelves(books, shelf_width)
  recur = memoize(->(i, shelf_height, remaining_space) {
    return shelf_height if i >= books.size

    thickness, height = books[i]

    # place a book onto the next shelf
    remaining_height = shelf_height + recur.(i + 1, height, shelf_width - thickness)

    # place a book onto the current shelf
    if thickness <= remaining_space
      remaining_height = [
        remaining_height,
        recur.(i + 1, [height, shelf_height].max, remaining_space - thickness)
      ].min
    end

    remaining_height
  })
  recur.(0, books[0][1], shelf_width)
end
