function intersection(nums1: number[], nums2: number[]): number[] {
  const counts: Map<number, Array<number>> = new Map<number, Array<number>>();

  const updateCounts = (tag: number) => (key: number): void => {
    if (!counts.has(key)) {
      counts.set(key, []);
    }
    counts.get(key)!.push(tag);
  };

  nums1.forEach(updateCounts(1));
  nums2.forEach(updateCounts(2));

  const common: number[] = [];
  counts.forEach((tags, key) => {
    if (tags.includes(1) && tags.includes(2)) {
      common.push(key);
    }
  });

  return common;
}
