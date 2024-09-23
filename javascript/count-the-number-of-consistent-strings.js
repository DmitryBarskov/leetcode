/**
 * @param {string} allowed
 * @param {string[]} words
 * @return {number}
 */
function countConsistentStrings(allowed, words) {
    let set = new Set(allowed);
    let count = 0;
    for (let i = 0; i < words.length; i++) {
        if (words[i].split("").every(char => set.has(char))) {
            count++;
        }
    }
    return count;
}
