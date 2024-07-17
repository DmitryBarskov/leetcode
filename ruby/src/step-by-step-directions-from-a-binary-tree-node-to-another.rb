# TreeNode = Struct.new(:val, :left, :right)
# @param {TreeNode} root
# @param {Integer} start_value
# @param {Integer} dest_value
# @return {String}
def get_directions(root, start_value, dest_value)
  start_path = find_path(root, start_value)
  dest_path = find_path(root, dest_value)
  common = start_path.lazy.zip(dest_path).take_while { _1 == _2 }.count
  result = (['U'] * (start_path.length - common)) + dest_path.drop(common)
  result.join
end

def find_path(root, val, path = [])
  return nil if root.nil?
  return path if root.val == val

  path.push('L')
  found_path = find_path(root.left, val, path)
  return found_path if found_path
  path.pop

  path.push('R')
  found_path = find_path(root.right, val, path)
  return found_path if found_path
  path.pop
  nil
end
