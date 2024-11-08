class Solution {
  int maximumSwap(int num) {
    List<int> digits = digitsFromInt(num);
    selectionSortOnce(digits);
    return intFromDigits(digits);
  }

  void selectionSortOnce(List<int> array) {
    for (int sortedStart = array.length - 1; sortedStart >= 1; sortedStart--) {
      int max = -1;
      int maxIndex = -1;
      for (int i = 0; i < sortedStart; i++) {
        if (array[i] > max) {
          max = array[i];
          maxIndex = i;
        }
      }
      if (array[sortedStart] >= max) {
        continue;
      }
      int temp = array[sortedStart];
      array[sortedStart] = array[maxIndex];
      array[maxIndex] = temp;
      break;
    }
  }

  List<int> digitsFromInt(int number) {
    List<int> digits = [];
    while (number > 0) {
      digits.add(number % 10);
      number = (number / 10).floor();
    }
    return digits;
  }

  int intFromDigits(List<int> digits) {
    int number = 0;
    for (int i = digits.length - 1; i >= 0; i--) {
      number *= 10;
      number += digits[i];
    }
    return number;
  }
}