// https://leetcode.com/problems/insert-interval/

type Interval = [number, number];

function insert(intervals: Interval[], newInterval: Interval): Interval[] {
  if (intervals.length === 0) {
    return [newInterval];
  }
  if (newInterval[1] < intervals[0][0]) {
    return [newInterval, ...intervals];
  }
  if (intervals[intervals.length - 1][1] < newInterval[0]) {
    return [...intervals, newInterval];
  }

  const result = new Array<Interval>();

  let i = 0;
  while (i < intervals.length && intervals[i][1] < newInterval[0]) {
    result.push(intervals[i]);
    i++;
  }

  if (intersecting(intervals[i], newInterval)) {
    result.push(mergeIntervals(intervals[i], newInterval));
  } else {
    result.push(newInterval);
    result.push(intervals[i]);
  }

  while (i < intervals.length && intervals[i][0] < newInterval[1]) {
    i++;
  }

  if (i < intervals.length && intersecting(intervals[i], result[result.length - 1])) {
    const uncompleteInterval = result.pop();
    result.push(mergeIntervals(intervals[i], uncompleteInterval));
    i++;
  }

  while (i < intervals.length) {
    result.push(intervals[i]);
    i++;
  }

  return result;
}

function intersecting(in1: Interval | undefined, in2: Interval | undefined): boolean {
  if (in1 === undefined || in2 === undefined) {
    return false;
  }
  return in1[0] <= in2[0] && in2[0] <= in1[1] || in1[0] <= in2[1] && in2[1] <= in1[1]
      || in2[0] <= in1[0] && in1[0] <= in2[1] || in2[0] <= in1[1] && in1[1] <= in2[1];
}

function mergeIntervals(in1: Interval, in2: Interval): Interval {
  return [Math.min(in1[0], in2[0]), Math.max(in1[1], in2[1])];
}


/**
 * The function will find the first item that meets the predicate for O(log n).
 * [1, 4, 8, 19, 36, 40, 43, 61, 86, 92], (x) => x >= 36
 * [F, F, F, F,  T,  T,  T,  T,  T,  T ]
 *               ^ - first item is in 4th position
 *
 * @param array - array to search in, must be sorted
 * @param predicate - function-predicate to select the target value,
 *                    must be monotonous
 * @return index of the first item that meets the predicate,
 *         -1 if there is no such an item
 */
function bsearch<T>(
  array: Array<T>,
  predicate: (item: T) => boolean,
  from: number = 0,
  to: number = array.length
): number {
  if (!predicate(array[to - 1])) {
    console.log(array[to - 1], 'does not match the predicate, returning -1')
    return -1;
  }

  let lo = from;
  let hi = to;

  while (lo < hi) {
    let mi = lo + Math.floor((hi - lo) / 2);

    if (predicate(array[mi])) {
      hi = mi;
    } else {
      lo = mi + 1;
    }
  }

  return lo;
}

// console.log(insert([[1,3],[6,9]], [2,5]));
// console.log(insert([], [2,5]));
// console.log(insert([[1,5]], [2, 3]));
// console.log(insert([[1,5]], [0, 6]));
// console.log(insert([[1,2],[3,5],[6,7],[8,10],[12,16]],  [4,8]));
// console.log(insert([[1,2],[3,5],[6,7],[8,10],[15,16]],  [11,14]));
console.log(insert([[1,5],[6,8]], [3,7]));
