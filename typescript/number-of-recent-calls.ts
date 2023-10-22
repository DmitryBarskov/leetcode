// https://leetcode.com/problems/number-of-recent-calls/

class RecentCounter {
  private requestTimestamps = new Array<number>();

  ping(timestamp: number): number {
    this.requestTimestamps.push(timestamp);
    const windowStart = binarySearch(this.requestTimestamps, (t) => t >= timestamp - 3000);
    return this.requestTimestamps.length - windowStart;
  }
}

function binarySearch<T>(arr: T[], predicate: (t: T) => boolean): number {
  let lo = 0;
  let hi = arr.length;

  while (lo < hi) {
    const mi = Math.floor((lo + hi) / 2);

    if (predicate(arr[mi])) {
      hi = mi;
    } else {
      lo = mi + 1;
    }
  }

  return lo;
}
