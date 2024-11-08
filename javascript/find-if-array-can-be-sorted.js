/**
 * @param {number[]} nums
 * @return {boolean}
 */
function canSortArray(nums) {
    const groups = groupBy(nums, countSetBits).flatMap(minMax);
    return isSorted(groups);
}

function groupBy(array, func) {
    if (array.length === 0) { return []; }

    const groups = [[array[0]]];
    let lastGroupValue = func(array[0]);
    for (let i = 1; i < array.length; i++) {
        const value = func(array[i]);
        if (value !== lastGroupValue) {
            groups.push([array[i]]);
            lastGroupValue = value;
        } else {
            groups[groups.length - 1].push(array[i]);
        }
    }
    return groups;
}

function countSetBits(num) {
    let setBits = 0;
    while (num > 0) {
        setBits += num % 2;
        num = Math.floor(num / 2);
    }
    return setBits;
}

function minMax(array) {
    let min = array[0];
    let max = array[0];
    for (const val of array) {
        if (val < min) {
            min = val;
        }
        if (val > max) {
            max = val;
        }
    }
    return [min, max];
}

function isSorted(array) {
    for (let i = 1; i < array.length; i++) {
        if (array[i - 1] > array[i]) {
            return false;
        }
    }
    return true;
}
