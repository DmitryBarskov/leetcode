# @leetup=custom
# @leetup=info id=1335 lang=ruby slug=minimum-difficulty-of-a-job-schedule


# You want to schedule a list of jobs in `d` days. Jobs are dependent (i.e To work
# on the `ith` job, you have to finish all the jobs `j` where `0 <= j < i`).
# 
# You have to finish at least one task every day. The difficulty of a job
# schedule is the sum of difficulties of each day of the `d` days. The difficulty
# of a day is the maximum difficulty of a job done on that day.
# 
# You are given an integer array `jobDifficulty` and an integer `d`. The
# difficulty of the `ith` job is `jobDifficulty[i]`.
# 
# Return *the minimum difficulty of a job schedule*. If you cannot find a schedule
# for the jobs return `-1`.
# 
# 
# Example 1:
# 
# Input: jobDifficulty = [6,5,4,3,2,1], d = 2
# Output: 7
# Explanation: First day you can finish the first 5 jobs, total difficulty = 6
# .
# Second day you can finish the last job, total difficulty = 1.
# The difficulty of the schedule = 6 + 1 = 7 
# 
# Example 2:
# 
# Input: jobDifficulty = [9,9,9], d = 4
# Output: -1
# Explanation: If you finish a job per day you will still have a free day. you
#  cannot find a schedule for the given jobs.
# 
# Example 3:
# 
# Input: jobDifficulty = [1,1,1], d = 3
# Output: 3
# Explanation: The schedule is one job per day. total difficulty will be 3.
# 
# 
# Constraints:
# 
# * `1 <= jobDifficulty.length <= 300`
# * `0 <= jobDifficulty[i] <= 1000`
# * `1 <= d <= 10`
# 

# @leetup=custom
# @leetup=code
def memoize(func)
  memo = {}
  ->(*args) {
    return memo[args] if memo.key?(args)
    memo[args] = func.call(*args)
  }
end

# @param {Integer[]} job_difficulty
# @param {Integer} total_days
# @return {Integer}
def min_difficulty(job_difficulty, total_days)
  recur = memoize ->(previous_day_difficulty, jobs_to_schedule, d) {
    return if jobs_to_schedule.length < d

    current, *other_jobs = jobs_to_schedule
    return recur.(current, other_jobs, d - 1) if previous_day_difficulty.nil?

    return [previous_day_difficulty, jobs_to_schedule.max].max if d <= 0 && jobs_to_schedule.any?
    return if jobs_to_schedule.empty? && d > 0
    return previous_day_difficulty if jobs_to_schedule.empty?

    [
      recur.([previous_day_difficulty, current].max, other_jobs, d),
      recur.(current, other_jobs, d - 1)&.+(previous_day_difficulty)
    ].compact.min
  }

  recur.(nil, job_difficulty, total_days) || -1
end
# @leetup=code

# @leetup=custom
min_difficulty([6,1], 2) => 7
min_difficulty([2, 3], 1) => 3
min_difficulty([6,5,1], 2) => 7
min_difficulty([6,5,4,1], 2) => 7
min_difficulty([6,5,4,3,1], 2) => 7
min_difficulty([6,5,4,3,2,1], 2) => 7
min_difficulty([1, 2, 3], 2) => 4

min_difficulty([6,5,4,3,2,7], 2) => 13
min_difficulty([6,5,4,3,2,1], 2) => 7
min_difficulty([9,9,9], 4) => -1
min_difficulty([1,1,1], 3) => 3
min_difficulty([186,398,479,206,885,423,805,112,925,656,16,932,740,292,671,360], 4) => 1803
min_difficulty([3, 7, 8, 9], 1) => 9
min_difficulty([2, 3, 7, 8, 9], 2) => 11
min_difficulty([1, 2, 3, 7, 8, 9], 3) => 12
min_difficulty([1, 2, 3, 7, 8, 9, 1], 4) => 13
# @leetup=custom
