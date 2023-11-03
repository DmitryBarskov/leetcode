# frozen_string_literal: true

# https://leetcode.com/problems/build-an-array-with-stack-operations

# @param {Integer[]} target
# @param {Integer} n
# @return {String[]}
def build_array(target, _n)
  stack_operations = []

  stream = 1
  target.each do |num|
    while stream < num
      stack_operations.push("Push", "Pop")
      stream += 1
    end
    stack_operations.push("Push")
    stream += 1
  end

  stack_operations
end

build_array([1, 3], 3) => ["Push", "Push", "Pop", "Push"]
build_array([2, 5], 5) => ["Push", "Pop", "Push", "Push", "Pop", "Push", "Pop", "Push"]
build_array([1, 2], 4) => ["Push", "Push"]
build_array([1, 2, 3], 3) => ["Push", "Push", "Push"]
