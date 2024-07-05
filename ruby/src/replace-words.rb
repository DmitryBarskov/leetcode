# frozen_string_literal: true

class Trie
  def self.from_array(array)
    new.tap do |trie|
      array.each { |word| trie.add(word) }
    end
  end

  def initialize
    @t = {}
  end

  def add(word)
    last_node = word.each_char.reduce(@t) do |t, char|
      t[char] ||= {}
    end
    last_node[:id] = true
  end

  def find_root_for(word)
    t = @t
    word.each_char.with_index do |c, i|
      t = t[c]
      return nil if t.nil?
      return word[..i] if t[:id]
    end
  end
end

# @param {String[]} dictionary
# @param {String} sentence
# @return {String}
def replace_words(dictionary, sentence)
  roots = Trie.from_array(dictionary)
  sentence.split.map do |word|
    roots.find_root_for(word) || word
  end.join(" ")
end

replace_words(["cat","bat","rat"], "the cattle was rattled by the battery") => "the cat was rat by the bat"
replace_words(["a","b","c"], "aadsfasf absbs bbab cadsfafs") => "a a b c"
