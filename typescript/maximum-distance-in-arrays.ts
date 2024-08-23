function maxDistance(arrays: number[][]): number {
    let min = arrays[0][0];
    let max = arrays[0].at(-1);
    let maxDistance = 0;
    for (let i = 1; i < arrays.length; i++) {
        maxDistance = Math.max(maxDistance, arrays[i].at(-1) - min);
        maxDistance = Math.max(maxDistance, max - arrays[i][0]);
        min = Math.min(min, arrays[i][0]);
        max = Math.max(max, arrays[i].at(-1));
    }
    return maxDistance;
}
