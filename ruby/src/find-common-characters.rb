# frozen_string_literal: true

def intersect(m1, m2)
  m1.keys.to_h { |k| [k, [m1[k], m2[k] || 0].min] }
end

# @param {String[]} words
# @return {String[]}
def common_chars(words)
  words.map(&:chars).map(&:tally).reduce { intersect(_1, _2) }.flat_map { [_1] * _2 }
end

common_chars(["bella","label","roller"]) => ["e","l","l"]
common_chars(["cool","lock","cook"]) => ["c","o"]
