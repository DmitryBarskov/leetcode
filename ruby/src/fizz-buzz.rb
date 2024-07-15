# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  (1..n).map do |num|
    if num % 3 == 0 && num % 5 == 0 then "FizzBuzz"
    elsif num % 3 == 0 then "Fizz"
    elsif num % 5 == 0 then "Buzz"
    else num.to_s
    end
  end
end
