/**
 * @param {string} s
 * @return {boolean}
 */
function repeatedSubstringPattern(s) {
    for (let i = Math.floor(s.length / 2); i >= 1; i--) {
        if (s.length % i == 0 && isRepetition(s, i)) {
            return true;
        }
    }
    return false;
}

function isRepetition(string, patternLength) {
    for (let i = patternLength; i < string.length; i++) {
        if (string[i % patternLength] != string[i]) {
            return false;
        }
    }
    return true;
}
