# @param {Integer} n
# @return {Integer}
def hamming_weight(n)
  n.digits(2).count(1)
end
