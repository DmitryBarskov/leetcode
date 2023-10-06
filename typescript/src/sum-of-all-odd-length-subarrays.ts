const sumOddLengthSubarrays = (arr: number[]): number => {
  const n = arr.length;
  let acc = 0;
  for (let i = 0; i < n; i++) {
    acc += arr[i] * Math.ceil((n - i) * (i + 1) / 2);
  }
  return acc;
};
