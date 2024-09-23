/**
 * @param {string[]} timePoints
 * @return {number}
 */
function findMinDifference(timePoints) {
    const sortedTimes = timePoints
        .map(parseTime)
        .sort((a, b) => a - b);
    let minDiff = Infinity;
    for (let i = 0; i < sortedTimes.length; i++) {
        let a = sortedTimes[(i + 1) % sortedTimes.length];
        let b =  sortedTimes[i];
        minDiff = Math.min(
            minDiff,
            Math.abs(a - b),
            Math.abs((a + 1440) - b) % 1440,
        );
    }
    return minDiff;
}

function parseTime(clockTime) {
    let [hh, mm] = clockTime.split(":");
    return parseInt(hh) * 60 + parseInt(mm);
}
