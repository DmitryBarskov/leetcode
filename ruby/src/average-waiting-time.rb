# @param {Integer[][]} customers
# @return {Float}
def average_waiting_time(customers)
  current_time = 0
  total_waiting_time = 0
  customers.each do |arrival, time|
    current_time = [arrival, current_time].max + time
    total_waiting_time += current_time - arrival
  end
  total_waiting_time.to_f / customers.count
end
