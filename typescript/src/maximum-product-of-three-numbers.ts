const notNull = (x: any) => x !== null;

function findMax(
  nums: number[],
  { except }: { except: number[] } = { except: [] }
): { maxValue: number, maxIndex: number } {
  let maxValue = null;
  let maxIndex = null;

  for (let i = 0; i < nums.length; i++) {
    if (except.includes(i)) { continue; }

    if (maxValue === null || nums[i] > maxValue) {
      maxValue = nums[i];
      maxIndex = i;
    }
  }

  return { maxValue: maxValue!!, maxIndex: maxIndex!! };
}

function findMin(
  nums: number[],
  { except }: { except: number[] } = { except: [] }
): { minValue: number, minIndex: number } {
  let minValue = null;
  let minIndex = null;

  for (let i = 0; i < nums.length; i++) {
    if (except.includes(i)) { continue; }

    if (minValue === null || nums[i] < minValue) {
      minValue = nums[i];
      minIndex = i;
    }
  }

  return { minValue: minValue!!, minIndex: minIndex!! };
}

function findThreeMax(nums: number[]): { values: number[], indexes: number[] } {
  let { maxValue: max1, maxIndex: max1Index } = findMax(nums);
  let { maxValue: max2, maxIndex: max2Index } = findMax(nums, { except: [max1Index] });
  let { maxValue: max3, maxIndex: max3Index } = findMax(nums, { except: [max1Index, max2Index] });

  return { values: [max3, max2, max1], indexes: [max3Index, max2Index, max1Index] };
}

function findThreeMin(nums: number[], { except = [] }: { except: number[] }): { values: number[], indexes: number[] } {
  let { minValue: min1, minIndex: min1Index } = findMin(nums, { except } );
  let { minValue: min2, minIndex: min2Index } = findMin(nums, { except: [...except, min1Index] });
  let { minValue: min3, minIndex: min3Index } = findMin(nums, { except: [...except, min1Index, min2Index] });

  return {
    values: [min1, min2, min3].filter(notNull),
    indexes: [min1Index, min2Index, min3Index].filter(notNull),
  };
}

function maximumProduct(nums: number[]): number {
  const { values: maxValues, indexes: maxIndexes } = findThreeMax(nums);
  const { values: minValues } = findThreeMin(nums, { except: maxIndexes });

  const sorted = [...minValues, ...maxValues];
  console.log({ sorted });

  return Math.max(
    sorted.at(0)!! * sorted.at(1)!! * sorted.at(-1)!!,
    sorted.at(-1)!! * sorted.at(-2)!! * sorted.at(-3)!!
  );
}

let testCase = [722,634,-504,-379,163,-613,-842,-578,750,951,-158,30,-238,-392,-487,-797,-157,-374,999,-5,-521,-879,-858,382,626,803,-347,903,-205,57,-342,186,-736,17,83,726,-960,343,-984,937,-758,-122,577,-595,-544,-559,903,-183,192,825,368,-674,57,-959,884,29,-681,-339,582,969,-95,-455,-275,205,-548,79,258,35,233,203,20,-936,878,-868,-458,-882,867,-664,-892,-687,322,844,-745,447,-909,-586,69,-88,88,445,-553,-666,130,-640,-918,-7,-420,-368,250,-786];

console.log(maximumProduct(testCase));
