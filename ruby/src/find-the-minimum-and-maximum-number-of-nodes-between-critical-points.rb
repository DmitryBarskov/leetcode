# @param {ListNode} head
# @return {Integer[]}
def nodes_between_critical_points(head)
  pred = nil
  curr = nil
  succ = head
  first_crit = nil
  prev_crit = nil
  min_distance = nil
  (1..).each do |index|
    break if succ.nil?

    if pred && curr &&
        (pred.val < curr.val && curr.val > succ.val
        || pred.val > curr.val && curr.val < succ.val)
      if first_crit.nil?
        first_crit = index
      else
        min_distance = [min_distance || Float::INFINITY, index - prev_crit].min
      end
      prev_crit = index
    end

    pred, curr, succ = curr, succ, succ.next
  end

  return [-1, -1] if min_distance.nil?

  [min_distance, prev_crit - first_crit]
end
