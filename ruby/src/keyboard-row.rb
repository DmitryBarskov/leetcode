ROWS = ["qwertyuiop", "asdfghjkl", "zxcvbnm"].map { _1.chars.to_set }

# @param {String[]} words
# @return {String[]}
def find_words(words)
  words.filter do |word|
    ROWS.any? do |row_chars|
      word.each_char.all? do |char|
        row_chars.include?(char.downcase)
      end
    end
  end
end
