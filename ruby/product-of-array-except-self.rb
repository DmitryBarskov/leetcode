# https://leetcode.com/problems/product-of-array-except-self/

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  reverse_product = Array.new(nums.size)

  reverse_product[-1] = nums[-1]

  (reverse_product.size - 2).downto(0) do |index|
    reverse_product[index] = nums[index] * reverse_product[index + 1]
  end

  product = 1
  (0..(reverse_product.size - 2)).each do |index|
    reverse_product[index] = product * reverse_product[index + 1]
    product *= nums[index]
  end
  reverse_product[-1] = product

  reverse_product
end
