# @param {Integer[][]} grid
# @return {Integer}
def projection_area(grid)
  xy_projection = grid.sum { _1.count(&:positive?) }
  xz_projection = grid.sum(&:max)
  yz_projection = grid.transpose.sum(&:max)
  xy_projection + xz_projection + yz_projection
end
