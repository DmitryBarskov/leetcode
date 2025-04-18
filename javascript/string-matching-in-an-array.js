/**
 * @param {string[]} words
 * @return {string[]}
 */
var stringMatching = function(words) {
    words.sort((a, b) => a.length - b.length);
    const substrings = [];
    for (let i = 0; i < words.length; i++) {
        for (let j = i + 1; j < words.length; j++) {
            if (words[j].includes(words[i])) {
                substrings.push(words[i]);
                break;
            }
        }
    }
    return substrings;
};
