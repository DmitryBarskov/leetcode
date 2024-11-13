const binarySearch = (array, predicate) => {
    let lo = 0;
    let hi = array.length;

    while (lo < hi) {
        const mi = Math.floor((lo + hi) / 2);
        if (predicate(array[mi])) {
            hi = mi;
        } else {
            lo = mi + 1;
        }
    }
    return lo;
};

const byPriceDescBeautyDesc = ([p1, b1], [p2, b2]) => {
    if (p1 > p2) {
        return -1;
    } else if (p1 < p2) {
        return 1;
    } else if (b1 > b2) {
        return -1;
    } else if (b1 < b2) {
        return 1;
    } else {
        return 0;
    }
};

/**
 * @param {number[][]} items
 * @param {number[]} queries
 * @return {number[]}
 */
const maximumBeauty = (items, queries) => {
    items.sort(byPriceDescBeautyDesc);
    const compact = [];
    for (let item of items) {
        while (compact.length > 0 && compact[compact.length - 1][1] <= item[1]) {
            compact.pop();
        }
        compact.push(item);
    }
    return queries.map((maxPrice) => {
        let index = binarySearch(
            compact,
            ([price, beauty]) => price <= maxPrice
        );
        if (compact[index] === undefined) {
            return 0;
        }
        return compact[index][1];
    });
};
