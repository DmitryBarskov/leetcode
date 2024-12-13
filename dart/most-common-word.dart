import "dart:collection";

class Solution {
  String mostCommonWord(String paragraph, List<String> banned) {
    var bannedWords = banned.toSet();
    return paragraph.split(RegExp(r'\W+')).fold<(String, Map<String, int>)>(
      ("", HashMap<String, int>.from({"": 0})),
      (acc, word) {
        word = word.toLowerCase();
        if (bannedWords.contains(word)) { return acc; }

        var (mostFrequent, frequencies) = acc;
        frequencies.update(word, (count) => count + 1, ifAbsent: () => 1);
        if (frequencies[word]! > frequencies[mostFrequent]!) {
          return (word, frequencies);
        }
        return (mostFrequent, frequencies);
      }
    ).$1;
  }
}