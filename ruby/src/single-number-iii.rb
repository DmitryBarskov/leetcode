# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
  xor = nums.reduce(&:^)
  first_bit = xor & -xor
  nums.each_with_object([0, 0]) do |num, res|
    if (num & first_bit).zero?
      res[0] ^= num
    else
      res[1] ^= num
    end
  end
end

def single_number_one_pass(nums)
  groups = Array.new(32) { [0, 0] }
  xor = 0
  nums.each do |num|
    xor ^= num
    groups.each_with_index do |group, i|
      if (num & (1 << i)).zero?
        group[0] ^= num
      else
        group[1] ^= num
      end
    end
  end
  groups[(xor & -xor).bit_length - 1]
end

single_number_one_pass([1,2,1,3,2,5]).sort => [3, 5]
single_number_one_pass([-1,0]).sort => [-1, 0]
single_number_one_pass([0,1]).sort => [0, 1]
single_number_one_pass([1,1,0,-2_147_483_648]).sort => [-2_147_483_648,0]
single_number_one_pass([-1_638_685_546,-2_084_083_624,-307_525_016,-930_251_592,-1_638_685_546,1_354_460_680,623_522_045,-1_370_026_032,
                        -307_525_016,-2_084_083_624,-930_251_592,472_570_145,-1_370_026_032,1_063_150_409,160_988_123,1_122_167_217,1_145_305_475,472_570_145,623_522_045,1_122_167_217,1_354_460_680,1_145_305_475]).sort => [ 160_988_123, 1_063_150_409 ]
