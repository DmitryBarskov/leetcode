# @param {Integer[]} tickets
# @param {Integer} k
# @return {Integer}
def time_required_to_buy(tickets, k)
  wait = 0
  (0...tickets.size).each do |i|
    if i <= k
      wait += [tickets[i], tickets[k]].min
    else
      wait += [tickets[i], tickets[k] - 1].min
    end
  end
  wait
end
