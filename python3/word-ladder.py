from typing import List

from collections import deque


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
                if diff >= 2:
                    break
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

        graph = { beginWord: set() }
        for i, _ in enumerate(wordList):
            if difference(beginWord, wordList[i]) == 1:
                graph[beginWord].add(wordList[i])
            for j in range(i + 1, len(wordList)):
                if difference(wordList[i], wordList[j]) == 1:
                    if wordList[i] not in graph:
                        graph[wordList[i]] = set()
                    if wordList[j] not in graph:
                        graph[wordList[j]] = set()
                    graph[wordList[i]].add(wordList[j])
                    graph[wordList[j]].add(wordList[i])

        return bfs(beginWord, endWord, graph) + 1
