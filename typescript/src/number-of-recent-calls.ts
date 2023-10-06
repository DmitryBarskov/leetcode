function binarySearch(arr: number[], value: number): number {
  let lo = 0;
  let hi = arr.length;

  while (lo < hi) {
    let mid = Math.floor((lo + hi) / 2);

    if (arr[mid] > value) {
      hi = mid;
    } else if (arr[mid] < value) {
      lo = mid + 1;
    } else {
      return mid;
    }
  }

  return lo;
}

console.log({
  result: binarySearch([10, 20, 30, 40, 50, 60], 0),
})
