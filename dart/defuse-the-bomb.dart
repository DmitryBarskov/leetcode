extension <T> on List<T> {
  T at(int index) {
    return this[(this.length + index % this.length) % this.length];
  }
  void set(int index, T value) {
    this[(this.length + index) % this.length] = value;
  }
}

class Solution {
  List<int> decrypt(List<int> code, int k) {
    var decrypted = List<int>.filled(code.length, 0);
    if (k == 0) {
      return decrypted;
    }

    int d = sign(k);
    int nextKSum = 0;
    for (int i = 0; i < d * k; i++) {
      nextKSum += code.at(d * i);
    }
    for (int i = 0; i < decrypted.length; i++) {
      nextKSum -= code.at(d * i);
      nextKSum += code.at(d * i + k);
      decrypted.set(d * i, nextKSum);
    }
    return decrypted;
  }

  int sign(int number) {
    if (number < 0) {
      return -1;
    } else if (number == 0) {
      return 0;
    } else {
      return 1;
    }
  }
}
