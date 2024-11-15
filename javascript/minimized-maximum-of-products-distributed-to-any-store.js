/**
 * @param {number} maxStores - available number of stores
 * @param {number[]} quantities - number of products of each type
 * @param {number} maxQuantity - number of products to be in one store
 * @return {boolean} - whether it is possible to put at most maxQuantity
 *                     items in each store
 */
function canDistribute(maxStores, quantities, maxQuantity) {
    let requiredStores = 0;
    for (let i = 0; i < quantities.length && requiredStores <= maxStores; i++) {
        requiredStores += Math.ceil(quantities[i] / maxQuantity);
    }
    return requiredStores <= maxStores;
}

/**
 * @param {number} n - number of stores
 * @param {number[]} quantities - number of each product type
 * @return {number} - maximum number of products in one store 
 */
function minimizedMaximum(n, quantities) {
    let lo = 0;
    let hi = quantities.reduce((a, b) => Math.max(a, b));
    while (lo < hi) {
        let mi = Math.floor((lo + hi) / 2);
        if (canDistribute(n, quantities, mi)) {
            hi = mi;
        } else {
            lo = mi + 1;
        }
    }
    return lo;
}
