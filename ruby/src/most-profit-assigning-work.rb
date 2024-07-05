# frozen_string_literal: true

# @param {Integer[]} difficulty
# @param {Integer[]} profit
# @param {Integer[]} worker
# @return {Integer}
def max_profit_assignment(difficulty, profit, worker)
  worker.sort!
  jobs = difficulty.zip(profit).sort
  j = 0
  total_profit = 0
  previous_job_profit = 0
  worker.each do |worker_max_difficulty|
    max_profit = previous_job_profit
    while j < jobs.size && jobs[j][0] <= worker_max_difficulty
      max_profit = [jobs[j][1], max_profit].max
      j += 1
    end
    total_profit += max_profit
    previous_job_profit = max_profit
  end
  total_profit
end
