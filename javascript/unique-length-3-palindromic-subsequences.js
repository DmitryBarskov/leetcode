/**
 * @param {string} s
 * @return {number}
 */
var countPalindromicSubsequence = function(s) {
    const first = {};
    const last = {};
    for (let i = 0; i < s.length; i++) {
        first[s[i]] ??= i;
        last[s[i]] = i;
    }
    let palindromes = 0;
    for (const char in first) {
        const uniq = new Set();
        for (let i = first[char] + 1; i < last[char]; i++) {
            uniq.add(s[i]);
        }
        palindromes += uniq.size;
    }
    return palindromes;
};
