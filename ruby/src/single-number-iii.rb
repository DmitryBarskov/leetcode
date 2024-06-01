# @param {Integer[]} nums
# @return {Integer[]}
def single_number(nums)
  xor = nums.reduce(&:^)
  first_bit = xor & -xor
  nums.each_with_object([0, 0]) do |num, res|
    if num & first_bit == 0
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
      if (num & (1 << i)) == 0
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
single_number_one_pass([1,1,0,-2147483648]).sort => [-2147483648,0]
single_number_one_pass([-1638685546,-2084083624,-307525016,-930251592,-1638685546,1354460680,623522045,-1370026032,-307525016,-2084083624,-930251592,472570145,-1370026032,1063150409,160988123,1122167217,1145305475,472570145,623522045,1122167217,1354460680,1145305475]).sort => [ 160988123, 1063150409 ]
