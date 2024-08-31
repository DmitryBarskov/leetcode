class MyHashSet {
  List<List<int>> _array = List<List<int>>.generate(
    1000, (int _i) => [], growable: false
  );

  MyHashSet();
  
  void add(int key) {
    _array[key % _array.length].add(key);
  }
  
  void remove(int key) {
    _array[key % _array.length].removeWhere((item) => item == key);
  }
  
  bool contains(int key) {
    return _array[key % _array.length].contains(key);
  }
}
