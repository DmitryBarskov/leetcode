# frozen_string_literal: true

# @param {String} s
# @return {Integer[]}
def partition_labels(s)
  last_index = s.each_char.with_index.to_h
  parts = []
  i = 0
  while i < s.length
    partition_end = i
    partition_size = 0
    while i <= partition_end
      partition_end = [partition_end, last_index[s[i]]].max
      partition_size += 1
      i += 1
    end
    parts.push(partition_size)
  end
  parts
end

partition_labels("ababcbacadefegdehijhklij") => [9,7,8]
partition_labels("eccbbbbdec") => [10]
