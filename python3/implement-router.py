from collections import deque


class Router:
    def __init__(self, memoryLimit: int):
        self.max_packets = memoryLimit
        self.queue = deque()
        self.by_destination = {}

    def addPacket(self, source: int, destination: int, timestamp: int) -> bool:
        # adds a packet if it is unique, removes oldest packets when memory limit exceeded
        if self._find(source, destination, timestamp) is not None:
            # duplicate packet
            return False

        self.queue.append([source, destination, timestamp])
        if destination not in self.by_destination:
            self.by_destination[destination] = deque()
        self.by_destination[destination].append((source, timestamp))

        while len(self.queue) > self.max_packets:
            self.forwardPacket()

        return True

    def forwardPacket(self) -> List[int]:
        # removes first packet from storage and returns it
        if len(self.queue) == 0:
            return []

        packet = self.queue.popleft()
        source, destination, timestamp = packet
        self.by_destination[destination].popleft()
        return packet

    def getCount(self, destination: int, startTime: int, endTime: int) -> int:
        # returns number of packets with given destination between start and end times
        packets = self.by_destination.get(destination, [])
        start = self._binary_search(packets, lambda x: x[1] >= startTime)
        end = self._binary_search(packets, lambda x: x[1] > endTime, start=start)
        return end - start

    def _binary_search(self, array, predicate, start = 0, end = None):
        l = start
        r = end or len(array)
        while l < r:
            m = (l + r) // 2
            if predicate(array[m]):
                r = m
            else:
                l = m + 1
        return l

    def _find(self, source, destination, timestamp):
        packets = self.by_destination.get(destination, [])
        start = self._binary_search(packets, lambda p: p[1] >= timestamp)
        i = start
        while i < len(packets) and packets[i][1] == packets[start][1]:
            if packets[i][0] == source:
                return i
            i += 1
        return None
