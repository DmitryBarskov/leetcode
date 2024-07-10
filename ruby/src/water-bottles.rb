# @param {Integer} num_bottles
# @param {Integer} num_exchange
# @return {Integer}
def num_water_bottles(num_bottles, num_exchange)
  loop.reduce(full: num_bottles, empty: 0, drunk: 0) do |acc, item|
    break acc if acc[:full].zero? && acc[:empty] < num_exchange

    {
      full: (acc[:empty] + acc[:full]) / num_exchange,
      empty: (acc[:empty] + acc[:full]) % num_exchange,
      drunk: acc[:drunk] + acc[:full]
    }
	end[:drunk]
end

num_water_bottles(9, 3) => 13
num_water_bottles(15, 4) => 19
