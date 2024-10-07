class Solution {
  bool areSentencesSimilar(String sentence1, String sentence2) {
    return similar(sentence1.split(" "), sentence2.split(" "));
  }

  bool similar(List<String> sentence1, List<String> sentence2) {
    if (sentence1.length < sentence2.length) {
      return similar(sentence2, sentence1);
    }
    if (sentence1.length == sentence2.length) {
      for (int i = 0; i < sentence1.length; i++) {
        if (sentence1[i] != sentence2[i]) {
          return false;
        }
      }
      return true;
    }
    // next check if sentence2 consists of some prefix and suffix of sentence1
    int prefix = 0;
    while (prefix < sentence2.length &&
            sentence1[prefix] == sentence2[prefix]) {
      prefix++;
    }
    prefix--;

    int suffix = sentence2.length - 1;
    for (int i = sentence1.length - 1; prefix < suffix; i--) {
      if (sentence1[i] != sentence2[suffix]) {
        break;
      }
      suffix--;
    }
    return prefix >= suffix;
  }
}

// docker run -it --rm -v %:% dart dart run %
void main() {
  print(Solution().areSentencesSimilar("My name is Haley", "My Haley"));
  print(Solution().areSentencesSimilar("of", "A lot of words"));
  print(Solution().areSentencesSimilar("Eating right now", "Eating"));
}
