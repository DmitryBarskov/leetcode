# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def beautiful_subsets(nums, k)
  count = nums.group_by(&:itself).to_h { |n, c| [n, c.count] }
  groups = []
  visit = Set.new

  count.each do |n, c|
    next if visit.include?(n)
    g = {}
    groups.push(g)

    n -= k while count.key?(n - k)

    while count.key?(n)
      g[n] = count[n]
      visit.add(n)
      n += k
    end
  end

  def iter(n, group, k, cache)
    return 1 unless group.key?(n)
    return cache[n] if cache.key?(n)

    skip = iter(n + k, group, k, cache)
    incl = (2 ** group[n] - 1) * iter(n + 2 * k, group, k, cache)
    cache[n] = skip + incl
  end
  cache = {}

  groups.reduce(1) { |res, g| res * iter(g.keys.min, g, k, cache) } - 1
end


beautiful_subsets([18, 12, 10, 5, 6, 2, 18, 3], 8) => 143
beautiful_subsets([2,4,6], 2) => 4
beautiful_subsets([1], 1) => 1
beautiful_subsets([10,4,5,7,2,1], 3) => 23
