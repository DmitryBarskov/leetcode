# frozen_string_literal: true

# @param {String} s
# @param {String[]} word_dict
# @return {String[]}
def word_break(s, word_dict)
  trie = {}
  word_dict.each do |word|
    t = trie
    word.each_char do |c|
      t[c] ||= {}
      t = t[c]
    end
    t[""] = true
  end
  recur(s, trie, trie, 0, "")
end

def recur(s, trie, t, i, current_word)
  if i >= s.length
    return [current_word] if current_word.length.positive? && t[""]

    return []

  end

  result = []
  result.concat(recur(s, trie, t[s[i]], i + 1, current_word + s[i])) if t[s[i]]

  if t[""]
    result.concat(
      recur(s, trie, trie, i, "").map { |sentence| "#{current_word} #{sentence}" }
    )
  end
  result
end

word_break("catsanddog", ["cat","cats","and","sand","dog"]) => ["cats and dog","cat sand dog"]
word_break("pineapplepenapple", ["apple","pen","applepen","pine","pineapple"]).sort => [
  "pine apple pen apple",
  "pine applepen apple",
  "pineapple pen apple",
]
word_break("catsandog", ["cats","dog","sand","and","cat"]) => []
