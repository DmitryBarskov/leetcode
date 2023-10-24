// https://leetcode.com/problems/insert-interval/

type Interval = [number, number];

function insert(intervals: Interval[], newInterval: Interval): Interval[] {
  if (intervals.length === 0) return [newInterval];

  const merged = new Array<Interval>();
  let i = 0;
  while (i < intervals.length && intervals[i][1] < newInterval[0]) {
    merged.push(intervals[i]);
    i++;
  }

  while (i < intervals.length && intersecting(intervals[i], newInterval)) {
    newInterval = mergeIntervals(intervals[i], newInterval);
    i++;
  }
  merged.push(newInterval);

  while (i < intervals.length) {
    merged.push(intervals[i]);
    i++;
  }

  return merged;
}

function intersecting(in1: Interval, in2: Interval): boolean {
  return in1[0] <= in2[0] && in2[0] <= in1[1] ||
    in1[0] <= in2[1] && in2[1] <= in1[1] ||
    in2[0] <= in1[0] && in1[0] <= in2[1] ||
    in2[0] <= in1[1] && in1[1] <= in2[1];
}

function mergeIntervals(in1: Interval, in2: Interval): Interval {
  return [Math.min(in1[0], in2[0]), Math.max(in1[1], in2[1])];
}
