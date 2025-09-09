from typing import List

from collections import deque
import itertools


class Solution:
    """
    All the words in wordList are unique.
    All the words are the same length.
    All the words consist of lowercase English letters.
    beginWord != endWord
    beginWord does not need to be in wordList
    1 <= beginWord.length <= 10
    1 <= wordList.length <= 5000

    >>> Solution().ladderLength("a", "c", ["a","b","c"])
    2
    >>> Solution().ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
    5
    >>> Solution().ladderLength("hit", "cog", ["hot","dot","dog","lot","log"])
    0
    >>> Solution().ladderLength("leet", "code", ["lest","leet","lose","code","lode","robe","lost"])
    6
    >>> Solution().ladderLength("ymain", "oecij", ["ymann","yycrj","oecij","ymcnj","yzcrj","yycij","xecij","yecij","ymanj","yzcnj","ymain"])
    10
    """

    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        def difference(word1, word2):
            diff = 0
            for i, _ in enumerate(word1):
                if word1[i] == word2[i]:
                    continue
                diff += 1
            return diff

        def bfs(start, target, graph):
            queue = deque([(start, 0)])
            visited = set()
            while len(queue) > 0:
                node, dist = queue.popleft()
                if node in visited:
                    continue
                visited.add(node)
                if node == target:
                    return dist

                for adj in graph.get(node, []):
                    queue.append((adj, dist + 1))
            return -1

        sorted_word_list = {
            diff: set(map(lambda t: t[0], words))
            for diff, words in itertools.groupby(
                sorted(
                    map(lambda w: (w, difference(beginWord, w)), wordList),
                    key=lambda t: t[1]
                ),
                lambda t: t[1]
            )
        }

        if 1 not in sorted_word_list:
            return 0

        graph = { beginWord: sorted_word_list[1] }

        for diff, words in sorted_word_list.items():
            for word1 in words:
                for d in range(-1, 2):
                    for word2 in sorted_word_list.get(diff + d, []):
                        if word1 not in graph:
                            graph[word1] = set()
                        if difference(word1, word2) != 1:
                            continue
                        graph[word1].add(word2)
        return bfs(beginWord, endWord, graph) + 1
