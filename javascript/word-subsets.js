/**
 * @param {string[]} words1
 * @param {string[]} words2
 * @return {string[]}
 */
function wordSubsets(words1, words2) {
    const required = words2.reduce((acc, word) => {
        requireBoth(acc, countChars(word));
        return acc;
    }, new Array(26).fill(0));
    return words1.filter((w1) => gte(countChars(w1), required));
}

function countChars(word) {
    const count = new Array(26).fill(0);
    for (let i = 0; i < word.length; i++) {
        count[charCode(word[i])]++;
    }
    return count;
}

function requireBoth(src, count) {
    for (let i = 0; i < src.length; i++) {
        src[i] = Math.max(src[i], count[i]);
    }
}

function charCode(char) {
    return char.codePointAt(0) - 'a'.codePointAt(0);
}

function gte(c1, c2) {
    for (let i = 0; i < c1.length; i++) {
        if (c1[i] < c2[i]) {
            return false
        }
    }
    return true;
}
