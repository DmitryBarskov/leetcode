# @param {Integer[]} rec1
# @param {Integer[]} rec2
# @return {Boolean}
def is_rectangle_overlap(rec1, rec2)
  x1, y1, x2, y2 = 0, 1, 2, 3

  return false if rec1[x2] <= rec2[x1] || rec2[x2] <= rec1[x1]
  return false if rec1[y2] <= rec2[y1] || rec2[y2] <= rec1[y1]

  true
end
