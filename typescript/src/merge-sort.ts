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

function testSorted(array: number[]) {
  let errors: number[][] = [];
  for (let i = 1; i < array.length; i++) {
    if (array[i - 1] > array[i]) {
      errors.push([i - 1, i]);
    }
  }

  if (errors.length === 0) {
    console.log('.');
  } else {
    console.error("Array", array, "is not sorted in positions", errors);
  }
}

function suite() {
  for (let i = 0; i < 10; i++) {
    let array = generateArray();
    mergeSort(array);
    testSorted(array);
  }
}

suite();
