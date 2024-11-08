class Solution {
  List<int> smallestRange(List<List<int>> nums) {
    Map<int, Set<int>> itemToSets = group(nums);
    List<int> sorted = mergeLists(nums);

    List<int> minRange = [];
    int minRangeLength = 200001;

    var includedSets = Map<int, int>();
    int l = 0;
    for (int r = 0; r < sorted.length; r++) {
      itemToSets[sorted[r]]!.forEach((int item) {
        includedSets.update(item, (v) => v + 1, ifAbsent: () => 1);
      });
      while (includedSets.length == nums.length) {
        var range = [sorted[l], sorted[r]];
        int rangeLength = range[1] - range[0];
        if (rangeLength < minRangeLength) {
          minRangeLength = rangeLength;
          minRange = range;
        }
        itemToSets[sorted[l]]!.forEach((int item) {
          includedSets.update(item, (v) => v - 1);
          if (includedSets[item]! <= 0) {
            includedSets.remove(item);
          }
        });
        l++;
      }
    }

    return minRange;
  }

  List<int> mergeLists(List<List<int>> lists) {
    List<int> merged = [];
    lists.forEach((List<int> subset) { merged.addAll(subset); });
    merged.sort((a, b) => a.compareTo(b));
    return merged;
  }

  Map<int, Set<int>> group(List<List<int>> lists) {
    Map<int, Set<int>> groups = {};
    for (int i = 0; i < lists.length; i++) {
      for (int j = 0; j < lists[i].length; j++) {
        groups.update(
          lists[i][j],
          (Set<int> v) { v.add(i); return v; },
          ifAbsent: () => Set<int>.from([i])
        );
      }
    }
    return groups;
  }
}
