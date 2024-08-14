# @param {Integer} low
# @param {Integer} high
# @return {Integer}
def count_symmetric_integers(low, high)
  (low..high).count { symmetric?(_1) }
end

def symmetric?(int)
  ds = int.digits
  n = ds.count

  n.even? && ds.first(n / 2).sum == ds.last(n / 2).sum
end
