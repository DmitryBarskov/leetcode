/**
 * @param {string[]} words
 * @param {string} pref
 * @return {number}
 */
function prefixCount(words, pref) {
    return words.reduce((acc, word) => hasPrefix(word, pref) ? acc + 1 : acc, 0);
}

function hasPrefix(word, prefix) {
    if (prefix.length > word.length) {
        return false;
    }
    for (let i = 0; i < prefix.length; i++) {
        if (word[i] != prefix[i]) {
            return false;
        }
    }
    return true;
}
