/**
 * @param {string} sentence
 * @param {string} searchWord
 * @return {number}
 */
function isPrefixOfWord(sentence, searchWord) {
    for (const [word, index] of words(sentence)) {
        if (word.startsWith(searchWord)) {
            return index;
        }
    }
    return -1;
}

class Substring {
    constructor(superString, start, end) {
        this.superString = superString;
        this.start = start;
        this.end = end;
    }
    startsWith(prefix) {
        if (prefix.length > this.end - this.start) { return false; }

        for (let i = this.start, j = 0; j < prefix.length; i++, j++) {
            if (this.superString[i] != prefix[j]) {
                return false;
            }
        }
        return true;
    }
}

function* words(sentence) {
    let i = 0;
    let wordNumber = 1;
    while (i < sentence.length) {
        let j = i;
        while (j < sentence.length && sentence[j] != " ") {
            j++;
        }
        yield [new Substring(sentence, i, j), wordNumber];
        wordNumber++;
        i = j + 1;
    }
}
