function mergeSort(array: number[], { from = 0, to = array.length} = {}) {
  if (from + 1 === to) {
    return;
  }

  let middle = Math.floor((from + to) / 2);
  mergeSort(array, { from, to: middle });
  mergeSort(array, { from: middle, to });

  let i = from;
  let j = middle;

  while (i < middle && j < to) {
    if (array[i] > array[j]) {
      [array[i], array[j]] = [array[j], array[i]];
      j++;
    } else {
      i++;
    }
  }
}

function generateArray(size: number = 20): number[] {
  let array = new Array<number>(size);

  for (let i = 0; i < array.length; i++) {
    array[i] = Math.floor((Math.random() - 0.5) * size * 2);
  }

  return array;
}
