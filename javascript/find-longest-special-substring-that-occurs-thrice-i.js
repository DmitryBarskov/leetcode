/**
 * @param {string} s
 * @return {number}
 */
function maximumLength(s) {
    let substringSize = 1;
    let substringLetter = s[0];
    const substrings = {};
    for (let i = 1; i < s.length; i++) {
        if (s[i] == substringLetter) {
            substringSize++;
        } else {
            substrings[substringLetter] ??= [];
            substrings[substringLetter].push(substringSize);
            substringSize = 1;
            substringLetter = s[i];
        }
    }
    substrings[substringLetter] ??= [];
    substrings[substringLetter].push(substringSize);

    let longestSpecial = 0;

    for (const letter in substrings) {
        substrings[letter].sort((a, b) => b - a);
        if (substrings[letter].length >= 3) {
            longestSpecial = Math.max(longestSpecial, substrings[letter][2]);
        }
        if (substrings[letter].length >= 2) {
            longestSpecial = Math.max(longestSpecial, Math.min(substrings[letter][0] - 1, substrings[letter][1]));
        }
        longestSpecial = Math.max(longestSpecial, substrings[letter][0] - 2);
    }
    if (longestSpecial == 0) {
        return -1;
    }
    return longestSpecial;
}
