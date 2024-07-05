# frozen_string_literal: true

# @param {String} s
# @param {Integer} k
# @return {Integer}
def get_lucky(s, k) = k.times.reduce(convert(s)) { transform(_1) }

def convert(s) = s.chars.map { _1.ord - 'a'.ord + 1 }.join.to_i

def transform(n) = n.digits.sum

get_lucky("iiii", 1) => 36
get_lucky("leetcode", 2) => 6
get_lucky("zbax", 2) => 8
