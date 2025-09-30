import functools


def flat_map(fn, collection):
    return [mapped for item in collection for mapped in fn(item)]


class Solution:
    keys = {
        '2': 'abc',
        '3': 'def',
        '4': 'ghi',
        '5': 'jkl',
        '6': 'mno',
        '7': 'pqrs',
        '8': 'tuv',
        '9': 'wxyz'
    }

    def letterCombinations(self, digits: str) -> list[str]:
        if digits == "":
            return []
        return functools.reduce(
            lambda acc, d: flat_map(lambda l: map(lambda seq: seq + l, acc), self.keys[d]),
            digits,
            [""]
        )
