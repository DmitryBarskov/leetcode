/**
 * @param {string} expression
 * @return {boolean}
 */
const parseBoolExpr = (expression) =>
    evalTree(parse(expression)[1][0]);

const and = (...args) => {
    for (let i = 0; i < args.length; i++) {
        if (evalTree(args[i]) === false) {
            return false;
        }
    }
    return true;
};

const or = (...args) => {
    for (let i = 0; i < args.length; i++) {
        if (evalTree(args[i]) === true) {
            return true;
        }
    }
    return false;
};
const not = (a) => !evalTree(a);

const parse = (expr, from = 0) => {
    const tokens = [];
    for (let i = from; i < expr.length; i++) {
        if (expr[i] === "f") {
            tokens.push(false);
            continue;
        } else if (expr[i] === "t") {
            tokens.push(true);
            continue;
        } else if (expr[i] === ",") {
            continue;
        } else if (expr[i] === ")") {
            return [i, tokens];
        }

        const [exprEnd, subExprTokens] = parse(expr, i + 2);
        if (expr[i] === "!") {
            tokens.push([not, ...subExprTokens]);
        } else if (expr[i] === "&") {
            tokens.push([and, ...subExprTokens]);
        } else if (expr[i] === "|") {
            tokens.push([or, ...subExprTokens]);
        }
        i = exprEnd;
    }
    return [expr.length - 1, tokens];
};

const evalTree = (node) => {
    if (node instanceof Array) {
        const [op, ...args] = node;
        return op(...args);
    } else if (typeof node === "boolean") {
        return node;
    }
};
