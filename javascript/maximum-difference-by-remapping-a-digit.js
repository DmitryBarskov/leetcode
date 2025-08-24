/**
 * @param {number} num
 * @return {number}
 */
const minMaxDifference = (num) => {
    const ds = digitsFromNumber(num);
    const max = numberFromDigits(remap(ds, 9));
    const min = numberFromDigits(remap(ds, 0));
    console.log({ ds, max, min });
    return max - min;
};

const remap = (ds, target) => {
    for (let i = ds.length - 1; i >= 0; i--) {
        if (ds[i] !== target) {
            return ds.map((d) => d == ds[i] ? target : d);
        }
    }
    return ds;
};

const digitsFromNumber = (num) => {
    const digits = [];
    while (num > 0) {
        digits.push(num % 10);
        num = Math.floor(num / 10);
    }
    return digits;
};

const numberFromDigits = (ds) => {
    return ds.reduce((acc, d, i) => acc + d * Math.pow(10, i));
};
