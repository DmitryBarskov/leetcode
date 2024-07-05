# frozen_string_literal: true

# @param {String} s
# @return {Integer}
def score_of_string(s)
  s.each_char.each_cons(2).sum { (_1.ord - _2.ord).abs }
end
