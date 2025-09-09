from typing import List

from collections import deque


class Solution:
    """
    >>> Solution().minMutation("AACCGGTT", "AACCGGTA", ["AACCGGTA"])
    1
    >>> Solution().minMutation("AACCGGTT", "AAACGGTA", ["AACCGGTA","AACCGCTA","AAACGGTA"])
    2
    >>> Solution().minMutation("AACCTTGG", "AATTCCGG", ["AATTCCGG","AACCTGGG","AACCCCGG","AACCTACC"])
    -1
    """

    def minMutation(self, startGene: str, endGene: str, bank: List[str]) -> int:
        def difference(dna1, dna2):
            diff = 0
            for i, _ in enumerate(dna1):
                if dna1[i] == dna2[i]:
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


        mutations = { startGene: set() }
        for i, _ in enumerate(bank):
            if difference(startGene, bank[i]) == 1:
                mutations[startGene].add(bank[i])
            for j in range(i + 1, len(bank)):
                if difference(bank[i], bank[j]) == 1:
                    if bank[i] not in mutations:
                        mutations[bank[i]] = set()
                    if bank[j] not in mutations:
                        mutations[bank[j]] = set()
                    mutations[bank[i]].add(bank[j])
                    mutations[bank[j]].add(bank[i])
        
            
        return bfs(startGene, endGene, mutations)
