/**
 * @param {number} n
 * @return {number[]}
 */
function lexicalOrder(n) {
    const result = [];
    for (let d = 1; d <= 9; d++) {
        each(d, n, (num) => {
            result.push(num);
        });
    }
    return result;
}

function each(start, limit, callback) {
    if (start > limit) {
        return;
    }
    callback(start);
    for (let d = 0; d <= 9; d++) {
        each(start * 10 + d, limit, callback);
    }
}
