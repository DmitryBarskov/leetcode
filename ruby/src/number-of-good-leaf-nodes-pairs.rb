# TreeNode = Struct.new :val, :left, :right
# @param {TreeNode} root
# @param {Integer} distance
# @return {Integer}
def count_pairs(root, distance)
  recur(root, distance)[0]
end

# @param {TreeNode} root
# @param {Integer} distance
# @return {Integer[]} distances to each leaf of the root
def recur(root, max_distance)
  return [0, []] if root.nil?
  return [0, [1]] if root.left.nil? && root.right.nil?

  left_pairs, left_dists = recur(root.left, max_distance)
  right_pairs, right_dists = recur(root.right, max_distance)

  new_pairs = left_dists.product(right_dists).count { _1 + _2 <= max_distance }

  [
    left_pairs + right_pairs + new_pairs,
    left_dists.concat(right_dists).filter_map { _1 + 1 if _1 < max_distance }
  ]
end
