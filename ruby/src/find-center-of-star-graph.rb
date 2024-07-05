# frozen_string_literal: true

# @param {Integer[][]} edges
# @return {Integer}
def find_center(edges)
  return edges[0][0] if edges[1].include?(edges[0][0])

  edges[0][1]
end
