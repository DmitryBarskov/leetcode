# 1234 -> 1221
# 999 -> 1001
# 1000 -> 999
# 12932 -> 12921 
# 99800 -> 99799
# 12120 -> 12121
# @param {String} number
# @return {String}
def nearest_palindromic(number)
  n = number.size
  small_half = number[...n / 2]
  big_half = number[..n / 2]
  candidates = [
    big_half + small_half.reverse,
    big_half + big_half.reverse,
    small_half + big_half.reverse,
    small_half + small_half.reverse,
    *[big_half, small_half].flat_map do |half|
      [:pred, :succ].flat_map do |inc|
        ["", "0"].flat_map do |suffix|
          (half + suffix).to_i.send(inc).to_s.then do
            [_1 + _1.reverse[1..], _1 + _1.reverse]
          end
        end
      end
    end
  ].filter { |c| c.to_i.to_s == c }
  candidates
    .reject { _1 == number || _1.empty? }
    .min_by { [(number.to_i - _1.to_i).abs, _1.to_i] }
end
