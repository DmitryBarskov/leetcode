var findMax = (array, { except = -1 } = {}) => {
  let max = null;
  let maxIndex = null;
  for (let i = 0; i < array.length; i++) {
    if (i === except) continue;

    if (max === null || max < array[i]) {
      max = array[i];
      maxIndex = i;
    }
  }
  return { value: max, index: maxIndex };
};

var findMin = (array, { except = -1 } = {}) => {
  let min = null;
  let minIndex = null;
  for (let i = 0; i < array.length; i++) {
    if (i === except) continue;

    if (min === null || min > array[i]) {
      min = array[i];
      minIndex = i;
    }
  }
  return { value: min, index: minIndex };
};

var maxProductDifference = function(nums) {
  let { value: firstMax, index: firstMaxIndex } = findMax(nums);
  let { value: secondMax } = findMax(nums, { except: firstMaxIndex });

  let { value: firstMin, index: firstMinIndex } = findMin(nums);
  let { value: secondMin } = findMin(nums, { except: firstMinIndex });

  return firstMax * secondMax - firstMin * secondMin;
};
