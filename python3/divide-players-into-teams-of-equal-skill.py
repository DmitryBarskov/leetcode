class Solution:
    def dividePlayers(self, skill: List[int]) -> int:
        target = sum(skill) * 2 / len(skill)
        if target == int(target):
            target = int(target)
        else:
            return -1
        free = {}
        chemistry = 0
        for s in skill:
            pair = target - s
            if pair in free:
                chemistry += s * (pair)
                free[pair] -= 1
                if free[pair] == 0:
                    del free[pair]
            else:
                if s not in free:
                    free[s] = 0
                free[s] += 1
        if free == {}:
            return chemistry
        else:
            return -1
