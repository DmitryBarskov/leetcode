from typing import List


class Solution:
    """
    n - number of languages (marked from 1 to n), 2 <= n <= 500
    m == len(languages) - number of users, 1 <= m <= 500
    languages[i] - ith user knows languages[i] (list of numbers)
    1 <= languages[i].length <= n
    1 <= languages[i][j] <= n
    friendships[i] - [u_i, v_i] pair denotes friendship between u_i and v_i
    1 <= u_i < v_i <= languages.length
    1 <= friendships.length <= 500
    All tuples (u_i, v_i) are unique
    languages[i] contains only unique values

    >>> Solution().minimumTeachings(n = 2, languages = [[1],[2],[1,2]], friendships = [[1,2],[1,3],[2,3]])
    1
    >>> Solution().minimumTeachings(n = 3, languages = [[2],[1,3],[1,2],[3]], friendships = [[1,4],[1,2],[3,4],[2,3]])
    2
    >>> Solution().minimumTeachings(5, [[1,2],[2,3],[1,3],[4],[5]], [[1,2],[2,3],[3,4],[4,5],[1,5]])
    2
    """

    def minimumTeachings(self, n: int, languages: List[List[int]], friendships: List[List[int]]) -> int:
        def intersecting(s1: set, s2: set) -> bool:
            if len(s1) < len(s2):
                return intersecting(s2, s1)
            for item in s1:
                if item in s2:
                    return True
            return False

        number_of_users = len(languages)
        languages = [set(l) for l in languages]

        people_to_teach = set()
        for u, v in friendships:
            if intersecting(languages[u - 1], languages[v - 1]):
                continue
            people_to_teach.add(u)
            people_to_teach.add(v)

        language_popularity = [0] * n
        for u in people_to_teach:
            for l in languages[u - 1]:
                language_popularity[l - 1] += 1

        return len(people_to_teach) - max(language_popularity)
