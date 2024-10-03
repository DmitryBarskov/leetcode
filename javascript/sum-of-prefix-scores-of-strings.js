/**
 * @param {string[]} words
 * @return {number[]}
 */
function sumPrefixScores(words) {
    const trie = buildTrie(words);
    return words.map(countScore(trie));
}

function buildTrie(words) {
    const trie = {};
    words.forEach(addToTrie(trie));
    return trie;
}

const addToTrie = (trie) => (word) => {
    let t = trie;
    for (let i = 0; i < word.length; i++) {
        t[word[i]] ??= {};
        t = t[word[i]];
        t.count ??= 0;
        t.count += 1;
    }
};

const countScore = (trie) => (word) => {
    let score = 0;
    let t = trie;
    for (let i = 0; i < word.length; i++) {
        score += t[word[i]].count;
        t = t[word[i]];
    }
    return score;
};
