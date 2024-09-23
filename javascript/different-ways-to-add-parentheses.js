/**
 * @param {string} expression
 * @return {number[]}
 */
function diffWaysToCompute(expression) {
    const tokens = expression.split(/\b/);
    return [...evalRecursive(tokens)(0, tokens.length)];
}

const operations = {
    '+': (a, b) => a + b,
    '-': (a, b) => a - b,
    '*': (a, b) => a * b,
};

const memoize = (func) => {
    const memo = {};
    return (...args) => {
        memo[args] ??= func(...args);
        return memo[args];
    };
};

const evalRecursive = (tokens) => {
    const recur = memoize((from, to) => {
        if (to - from <= 1) {
            return [parseInt(tokens[from])];
        }
        const results = [];
        for (let i = from; i < to; i++) {
            if (!operations[tokens[i]]) { continue; }

            const op = operations[tokens[i]];

            const left = recur(from, i);
            const right = recur(i + 1, to);
            left.forEach((l) => {
                right.forEach((r) => {
                    results.push(op(l, r));
                });
            });
        }
        return results;
    });
    return recur;
};
