class Solution {
  bool canThreePartsEqualSum(List<int> arr) {
    int sum = arr.reduce((acc, x) => acc + x);
    int oneThird = (sum / 3).toInt();
    if (oneThird * 3 != sum) {
      return false;
    }
    int l = 1;
    int firstPart = arr[0];
    while (l < arr.length && firstPart != oneThird) {
      firstPart += arr[l];
      l += 1;
    }
    int r = arr.length - 2;
    int thirdPart = arr[arr.length - 1];
    while (r >= 0 && thirdPart != oneThird) {
      thirdPart += arr[r];
      r -= 1;
    }
    return l < r || (l == r && arr[l] == oneThird);
  }
}