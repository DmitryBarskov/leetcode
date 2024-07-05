# frozen_string_literal: true

# @param {Integer[]} arr
# @return {Boolean}
def three_consecutive_odds(arr)
  cons_odds = 0
  arr.each do |num|
    case [num.odd?, cons_odds]
    in true, 2
      return true
    in true, _
      cons_odds += 1
    in false, _
      cons_odds = 0
    end
  end
  false
end

three_consecutive_odds([2, 6, 4, 1]) => false
three_consecutive_odds([1,2,34,3,4,5,7,23,12]) => true
