class Node:
    def __init__(self, value: int, succ = None):
        self._value = value
        self._next = succ


class LinkedList:
    def __init__(self):
        self._tail = Node("tail")
        self._head = Node("head", self._tail)
        self._size = 0

    def append(self, value) -> Node:
        self._size += 1
        last_item = self._tail
        last_item._value = value

        self._tail = Node("tail")
        last_item._next = self._tail
        return last_item

    def pop_first(self) -> int:
        self._size -= 1
        first = self._head._next
        self._head._next = first._next
        return first._value

    def first(self) -> int:
        first = self._head._next
        return first._value

    def remove_node(self, node: Node):
        if node._next == self._tail:
            self._tail = node
        node._value = node._next._value
        node._next = node._next._next
        self._size -= 1

    def __len__(self):
        return self._size

    def __str__(self):
        values = []
        it = self._head
        while it is not None:
            values.append(str(it._value))
            it = it._next
        return 'LL(' + ' -> '.join(values) + ')'


class LRUCache:
    """
    The functions get and put must each run in O(1) average time complexity

    >>> lru_cache = LRUCache(2)
    >>> lru_cache.put(1, 1) # cache is {1=1}
    >>> lru_cache.put(2, 2) # cache is {1=1, 2=2}
    >>> lru_cache.get(1)
    1
    >>> lru_cache.put(3, 3) # LRU key was 2, evicts key 2, cache is {1=1, 3=3}
    >>> lru_cache.get(2)
    -1
    >>> lru_cache.put(4, 4) # LRU key was 1, evicts key 1, cache is {4=4, 3=3}
    >>> lru_cache.get(1)
    -1
    >>> lru_cache.get(3)
    3
    >>> lru_cache.get(4)
    4

    >>> lru_cache = LRUCache(1)
    >>> lru_cache.put(2, 1) # {2=1}
    >>> lru_cache.get(2)
    1
    >>> lru_cache.put(3, 2) # {3=2}
    >>> lru_cache.get(2)
    -1
    >>> lru_cache.get(3)
    2

    >>> lru_cache = LRUCache(10)
    >>> lru_cache.put(10, 13)
    >>> lru_cache.put(3, 17)
    >>> lru_cache.put(6, 11)
    >>> lru_cache.put(10, 5)
    >>> lru_cache.put(9, 10)
    >>> lru_cache.get(13)
    -1
    >>> lru_cache.put(2, 19)
    >>> lru_cache.get(2)
    19
    >>> lru_cache.get(3)
    17
    >>> lru_cache.put(5, 25)
    >>> lru_cache.get(8)
    -1
    >>> lru_cache.put(9, 22)
    >>> lru_cache.put(5, 5)
    >>> lru_cache.put(1, 30)
    >>> lru_cache.get(11)
    -1
    >>> lru_cache.put(9, 12)
    >>> lru_cache.get(7)
    -1
    >>> lru_cache.get(5)
    5
    >>> lru_cache.get(8)
    -1
    >>> lru_cache.get(9)
    12
    >>> lru_cache.put(4, 30)
    >>> lru_cache.put(9, 3)
    >>> lru_cache.get(9)
    3
    >>> lru_cache.get(10)
    5
    >>> lru_cache.get(10)
    5
    >>> lru_cache.put(6, 14)
    >>> lru_cache.put(3, 1)
    >>> lru_cache.get(3)
    1
    >>> lru_cache.put(10, 11)
    >>> lru_cache.get(8)
    -1
    >>> lru_cache.put(2, 14)
    >>> lru_cache.get(1)
    30
    >>> lru_cache.get(5)
    5
    >>> lru_cache.get(4)
    30
    >>> lru_cache.put(11, 4)
    >>> lru_cache.put(12, 24)
    >>> lru_cache.put(5, 18)
    >>> lru_cache.get(13)
    -1
    >>> lru_cache.put(7, 23)
    >>> lru_cache.get(8)
    -1
    >>> lru_cache.get(12)
    24
    >>> lru_cache.put(3, 27)
    >>> lru_cache.put(2, 12)
    >>> lru_cache.get(5)
    18
    >>> lru_cache.put(2, 9)
    >>> lru_cache.put(13, 4)
    >>> lru_cache.put(8, 18)
    >>> lru_cache.put(1, 7)
    >>> lru_cache.get(6)
    -1
    >>> lru_cache.put(9, 29)
    >>> lru_cache.put(8, 21)
    >>> lru_cache.get(5)
    18
    >>> lru_cache.put(6, 30)
    >>> lru_cache.put(1, 12)
    >>> lru_cache.get(10)
    -1
    >>> lru_cache.put(4, 15)
    >>> lru_cache.put(7, 22)
    >>> lru_cache.put(11, 26)
    >>> lru_cache.put(8, 17)
    >>> lru_cache.put(9, 29)
    >>> lru_cache.get(5)
    18
    >>> lru_cache.put(3, 4)
    >>> lru_cache.put(11, 30)
    >>> lru_cache.get(12)
    -1
    >>> lru_cache.put(4, 29)
    >>> lru_cache.get(3)
    4
    >>> lru_cache.get(9)
    29
    >>> lru_cache.get(6)
    30
    >>> lru_cache.put(3, 4)
    >>> lru_cache.get(1)
    12
    >>> lru_cache.get(10)
    -1
    >>> lru_cache.put(3, 29)
    >>> lru_cache.put(10, 28)
    >>> lru_cache.put(1, 20)
    >>> lru_cache.put(11, 13)
    >>> lru_cache.get(3)
    29
    >>> lru_cache.put(3, 12)
    >>> lru_cache.put(3, 8)
    >>> lru_cache.put(10, 9)
    >>> lru_cache.put(3, 26)
    >>> lru_cache.get(8)
    17
    >>> lru_cache.get(7)
    22
    >>> lru_cache.get(5)
    18
    >>> lru_cache.put(13, 17)
    >>> lru_cache.put(2, 27)
    >>> lru_cache.put(11, 15)
    >>> lru_cache.get(12)
    -1
    >>> lru_cache.put(9, 19)
    >>> lru_cache.put(2, 15)
    >>> lru_cache.put(3, 16)
    >>> lru_cache.get(1)
    20
    >>> lru_cache.put(12, 17)
    >>> lru_cache.put(9, 1)
    >>> lru_cache.put(6, 19)
    >>> lru_cache.get(4)
    -1
    >>> lru_cache.get(5)
    18
    >>> lru_cache.get(5)
    18
    >>> lru_cache.put(8, 1)
    >>> lru_cache.put(11, 7)
    >>> lru_cache.put(5, 2)
    >>> lru_cache.put(9, 28)
    >>> lru_cache.get(1)
    20
    >>> lru_cache.put(2, 2)
    >>> lru_cache.put(7, 4)
    >>> lru_cache.put(4, 22)
    >>> lru_cache.put(7, 24)
    >>> lru_cache.put(9, 26)
    >>> lru_cache.put(13, 28)
    >>> lru_cache.put(11, 26)
    """

    def __init__(self, capacity: int):
        # Initialize the LRU cache with positive size capacity
        self._capacity = capacity
        self._dict = {}
        self._nodes = {}
        self._keys_order_of_use = LinkedList()

    def get(self, key: int) -> int:
        # Return the value of the key if the key exists, otherwise return -1
        if key not in self._dict:
            return -1
        self._make_recent(key)
        return self._dict[key]

    def put(self, key: int, value: int) -> None:
        # Update the value of the key if the key exists.
        # Otherwise, add the key-value pair to the cache.
        # If the number of keys exceeds the capacity from this operation,
        # evict the least recently used key.
        while key not in self._dict and len(self) >= self._capacity:
            lru = self._keys_order_of_use.pop_first()
            self._nodes.pop(lru)
            self._dict.pop(lru)

        self._dict[key] = value
        self._nodes[key] = self._keys_order_of_use.append(key)

    def _make_recent(self, key):
        self._keys_order_of_use.remove_node(self._nodes[key])
        self._nodes[key] = self._keys_order_of_use.append(key)

    def __len__(self):
        return len(self._keys_order_of_use)

    def __str__(self):
        return f"LRU({len(self)}/{self._capacity} ord={self._keys_order_of_use} ind={self._nodes} {self._dict})"
