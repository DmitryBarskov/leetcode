# @param {String[]} words
# @param {Character[]} letters
# @param {Integer[]} score
# @return {Integer}
def max_score_words(words, letters, scores)
  count_letters = Array.new(26) { 0 }
  letters.each { |l| count_letters[l.ord - "a".ord] += 1 }
  recur(words, count_letters, scores, 0)
end

def recur(words, letters, scores, i)
  return 0 if i >= words.size

  can_form, new_letters, score = form_word(words[i], letters, scores)
  if can_form
    [
      score + recur(words, new_letters, scores, i + 1),
      recur(words, letters, scores, i + 1)
    ].max
  else
    recur(words, letters, scores, i + 1) # skip the word
  end
end

# @return {[Boolean, Integer[], Integer]} -
#          [can form word, letters count left, score]
def form_word(word, letters, score)
  left = letters.dup
  sc = 0
  (0...word.length).each do |i|
    code = word[i].ord - "a".ord

    return [false, letters, 0] if left[code] <= 0

    left[code] -= 1
    sc += score[code]
  end
  [true, left, sc]
end

max_score_words(
  ["dog","cat","dad","good"],
  ["a","a","c","d","d","d","g","o","o"],
  [1,0,9,5,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0]
) => 23

max_score_words(
  ["leetcode"],
  ["l","e","t","c","o","d"],
  [0,0,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0]
) => 0
