class OrderedStream:
    __slots__ = ('_values', '_ptr')

    def __init__(self, n: int):
        self._values = {}
        self._ptr = 1

    def insert(self, idKey: int, value: str) -> List[str]:
        self._values[idKey] = value
        chunk = []
        while self._ptr in self._values:
            chunk.append(self._values.pop(self._ptr))
            self._ptr += 1
        return chunk
