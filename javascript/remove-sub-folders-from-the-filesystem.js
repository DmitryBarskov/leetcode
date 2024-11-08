/**
 * @param {string[]} folders
 * @return {string[]}
 */
function removeSubfolders(folders) {
    const trie = buildTrie(folders);
    const withoutSubfolders = [];
    searchWithPath(trie, (path) => {
        withoutSubfolders.push(path);
    });
    return withoutSubfolders;
}

function buildTrie(folders) {
    const trie = {};
    for (const folder of folders) {
        const [_, ...path] = folder.split("/");
        t = trie;
        for (const dir of path) {
            t[dir] ??= {};
            t = t[dir];
        }
        t.path = folder;
    }
    return trie;
}

function searchWithPath(trie, callback) {
    if (trie == null) { return; }
    if (trie.path) { return callback(trie.path); }

    for (const dir of Object.values(trie)) {
        searchWithPath(dir, callback);
    }
}
