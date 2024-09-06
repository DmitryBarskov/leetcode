class Solution {
  List<int> missingRolls(List<int> rolls, int mean, int n) {
    int sum = mean * (n + rolls.length);
    sum -= rolls.fold<int>(0, (acc, r) => acc + r);
    double averageRoll = sum / n;
    if (averageRoll < 1 || averageRoll > 6) {
      return [];
    }
    int popularRoll = averageRoll.floor();
    var missingRolls = List<int>.generate(n, (_) {
      sum -= popularRoll;
      return popularRoll;
    });
    for (int i = 0; sum > 0; i++) {
      missingRolls[i] += 1;
      sum -= 1;
    }
    return missingRolls;
  }
}
