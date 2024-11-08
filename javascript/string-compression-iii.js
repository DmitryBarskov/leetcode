/**
 * @param {string} word
 * @return {string}
 */
function compressedString(word) {
    const comp = [];
    for (let i = 0; i < word.length;) {
        const c = word[i];
        let count = 0;
        while (word[i] == c && count < 9) {
            i++;
            count++;
        }
        comp.push(count, c);
    }
    return comp.join("");
}
