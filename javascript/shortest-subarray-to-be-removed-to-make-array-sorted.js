/**
 * @param {number[]} arr
 * @return {number}
 */
function findLengthOfShortestSubarray(arr) {
    let sortedPrefix = 1;
    while (sortedPrefix < arr.length && arr[sortedPrefix - 1] <= arr[sortedPrefix]) {
        sortedPrefix++;
    }
    if (sortedPrefix >= arr.length) {
        return 0;
    }

    let sortedSuffix = arr.length - 1;
    while (sortedSuffix > 0 && arr[sortedSuffix - 1] <= arr[sortedSuffix]) {
        sortedSuffix--;
    }

    let shortest = Math.min(arr.length - sortedPrefix, sortedSuffix);
    for (let i = 0; i < sortedPrefix; i++) {
        while (arr[i] > arr[sortedSuffix]) {
            sortedSuffix++;
        }
        console.log({ i, sortedSuffix });
        shortest = Math.min(sortedSuffix - i - 1, shortest);
    }

    return shortest;
}
