from typing import List
import itertools


class UnionFind:
    def __init__(self):
        self._parent = {}
        self._size = {}

    def add(self, x):
        if x in self._parent:
            return
        self._parent[x] = x
        self._size[x] = 1

    def find(self, x):
        if x == self._parent[x]:
            return x
        return self.find(self._parent[x])

    def union(self, x, y):
        if x != self._parent[x]:
            return self.union(self._parent[x], y)
        if y != self._parent[y]:
            return self.union(x, self._parent[y])
        if self._size[x] < self._size[y]:
            return self.union(y, x)
        self._parent[y] = x
        self._size[x] += self._size[y]

    def disjoint_sets(self):
        parent_to_children = {}
        for key, value in self._parent.items():
            parent = self.find(key)
            if parent not in parent_to_children:
                parent_to_children[parent] = []
            parent_to_children[parent].append(key)
        return parent_to_children


class Solution:
    """
    >>> Solution().accountsMerge([["John","johnsmith@mail.com","john_newyork@mail.com"],["John","johnsmith@mail.com","john00@mail.com"],["Mary","mary@mail.com"],["John","johnnybravo@mail.com"]])
    [['John', 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'], ['Mary', 'mary@mail.com'], ['John', 'johnnybravo@mail.com']]
    >>> sorted(Solution().accountsMerge([["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe1@m.co"],["Kevin","Kevin3@m.co","Kevin5@m.co","Kevin0@m.co"],["Ethan","Ethan5@m.co","Ethan4@m.co","Ethan0@m.co"],["Hanzo","Hanzo3@m.co","Hanzo1@m.co","Hanzo0@m.co"],["Fern","Fern5@m.co","Fern1@m.co","Fern0@m.co"]]))
    [['Ethan', 'Ethan0@m.co', 'Ethan4@m.co', 'Ethan5@m.co'], ['Fern', 'Fern0@m.co', 'Fern1@m.co', 'Fern5@m.co'], ['Gabe', 'Gabe0@m.co', 'Gabe1@m.co', 'Gabe3@m.co'], ['Hanzo', 'Hanzo0@m.co', 'Hanzo1@m.co', 'Hanzo3@m.co'], ['Kevin', 'Kevin0@m.co', 'Kevin3@m.co', 'Kevin5@m.co']]
    >>> sorted(Solution().accountsMerge([["Ethan","Ethan1@m.co","Ethan2@m.co","Ethan0@m.co"],["David","David1@m.co","David2@m.co","David0@m.co"],["Lily","Lily0@m.co","Lily0@m.co","Lily4@m.co"],["Gabe","Gabe1@m.co","Gabe4@m.co","Gabe0@m.co"],["Ethan","Ethan2@m.co","Ethan1@m.co","Ethan0@m.co"]]))
    [['David', 'David0@m.co', 'David1@m.co', 'David2@m.co'], ['Ethan', 'Ethan0@m.co', 'Ethan1@m.co', 'Ethan2@m.co'], ['Gabe', 'Gabe0@m.co', 'Gabe1@m.co', 'Gabe4@m.co'], ['Lily', 'Lily0@m.co', 'Lily4@m.co']]
    """

    def accountsMerge(self, accounts: List[List[str]]) -> List[List[str]]:
        name_by_email = {}
        union_find = UnionFind()
        for accs in accounts:
            name = accs[0]
            first_email = accs[1]
            union_find.add(first_email)
            name_by_email[first_email] = name
            for i in range(2, len(accs)):
                name_by_email[accs[i]] = name
                union_find.add(accs[i])
                union_find.union(first_email, accs[i])
        merged = []
        for first_email, emails in union_find.disjoint_sets().items():
            name = name_by_email[first_email]
            merged.append([name, *sorted(emails)])
        return merged
