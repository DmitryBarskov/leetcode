extension Numeric on int {
  int digitsSum() {
    int remainder = this;
    int sum = 0;
    while (remainder > 0) {
      sum += remainder % 10;
      remainder ~/= 10;
    }
    return sum;
  }
}

class Solution {
  int addDigits(int num) {
    if (num <= 9) {
      return num;
    }
    return addDigits(num.digitsSum());
  }
}