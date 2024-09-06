class Solution {
  int getLucky(String s, int k) {
    return int.parse(transform(convert(s), k));
  }

  String convert(String s) {
    return s.runes.map((int c) => c - 96).join("");
  }

  String transform(String s, int k) {
    return Iterable.generate(k).fold<String>(s, (String acc, _) {
      return acc.runes.fold<int>(0, (int acc, int char) {
        var code = char - 48;
        return acc + (code ~/ 10) + (code % 10);
      }).toString();
    });
  }
}
