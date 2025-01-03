const VOWELS = new Set(['a', 'e', 'i', 'o', 'u']);

const isVowelWord = (str) => VOWELS.has(str[0]) && VOWELS.has(str[str.length - 1]);

/**
 * @param {string[]} words
 * @param {number[][]} queries
 * @return {number[]}
 */
const vowelStrings = (words, queries) => {
    const vowelStringsPrefix = new Array(words.length + 1);
    vowelStringsPrefix[0] = 0;
    for (let i = 1; i < vowelStringsPrefix.length; i++) {
        if (isVowelWord(words[i - 1])) {
            vowelStringsPrefix[i] = vowelStringsPrefix[i - 1] + 1;
        } else {
            vowelStringsPrefix[i] = vowelStringsPrefix[i - 1];
        }
    }
    return queries.map(([l, r]) => vowelStringsPrefix[r + 1] - vowelStringsPrefix[l]);
};
