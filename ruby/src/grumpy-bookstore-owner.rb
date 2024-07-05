# frozen_string_literal: true

# @param {Integer[]} customers
# @param {Integer[]} grumpy
# @param {Integer} minutes
# @return {Integer}
def max_satisfied(customers, grumpy, minutes)
  satisfied = 0
  max_satisfied_when_grumpy = 0
  could_satisfy = 0
  customers.size.times do |i|
    could_satisfy -= customers[i - minutes] if i - minutes >= 0 && grumpy[i - minutes] == 1

    if grumpy[i].zero?
      satisfied += customers[i]
      next
    end

    could_satisfy += customers[i]
    max_satisfied_when_grumpy = could_satisfy if could_satisfy > max_satisfied_when_grumpy
  end
  satisfied + max_satisfied_when_grumpy
end
