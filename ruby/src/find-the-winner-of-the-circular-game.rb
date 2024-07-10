# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def find_the_winner(n, k) = recur(n, k) + 1

def recur(n, k)
  return 0 if n == 1

  (recur(n - 1, k) + k) % n
end

find_the_winner(5, 2) => 3
find_the_winner(6, 5) => 1
