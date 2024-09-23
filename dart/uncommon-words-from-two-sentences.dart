import 'dart:collection';

class Solution {
  List<String> uncommonFromSentences(String s1, String s2) {
    Map<String, int> wordsCount = HashMap();
    for (var word in s1.split(" ")) {
      wordsCount[word] = (wordsCount[word] ?? 0) + 1;
    }
    for (var word in s2.split(" ")) {
      wordsCount[word] = (wordsCount[word] ?? 0) + 1;
    }
    List<String> uncommonWords = [];
    wordsCount.forEach((word, count) {
      if (count == 1) {
        uncommonWords.add(word);
      }
    });
    return uncommonWords;
  }
}