/**
 * @param {string[]} words
 * @return {number}
 */
function countPrefixSuffixPairs(words) {
    let count = 0;
    for (let i = 0; i < words.length; i++) {
        for (let j = i + 1; j < words.length; j++) {
            if (isPrefixAndSuffix(words[i], words[j])) {
                count++;
            }
        }
    }
    return count;
}

function isPrefixAndSuffix(str1, str2) {
    if (str1.length > str2.length) {
        return false;
    }
    for (let i = 0; i < str1.length; i++) {
        if (str1[i] != str2[i]) {
            return false;
        }
    }
    for (let i = 0, j = str2.length - str1.length; i < str1.length; i++, j++) {
        if (str1[i] != str2[j]) {
            return false;
        }
    }
    return true;
}
