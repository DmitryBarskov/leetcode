var findWordEnd = (str, from) => {
  let wordEnd = from;
  while (str[wordEnd] !== ' ' && wordEnd < str.length) {
    wordEnd += 1;
  }
  return wordEnd - 1;
};

var swap = (array, i, j) => {
  let arrayI = array[i];
  array[i] = array[j];
  array[j] = arrayI;
};

var reverseInString = (string, from, to) => {
  let i = from, j = to;
  while (i < j) {
    swap(string, i, j);
    i++;
    j--;
  }
};

/**
 * @param {string} s
 * @return {string}
 */
var reverseWords = function(s) {
  let output = new Array(s.length);
  for (let i = 0; i < output.length; i++) {
    let wordEnd = findWordEnd(output, i);
    reverseInString(output, i, wordEnd);
    i = wordEnd + 1;
  }
  return output;
};

console.log(reverseWords("Let's take LeetCode contest"));
