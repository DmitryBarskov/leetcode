class Solution:
    """
    >>> Solution().badSensor(sensor1 = [2,3,4,5], sensor2 = [2,1,3,4])
    1
    >>> Solution().badSensor(sensor1 = [2,2,2,2,2], sensor2 = [2,2,2,2,5])
    -1
    >>> Solution().badSensor(sensor1 = [2,3,2,2,3,2], sensor2 = [2,3,2,3,2,7])
    2
    """
    def badSensor(self, sensor1: list[int], sensor2: list[int]) -> int:
        for i, (d1, d2) in enumerate(zip(sensor1, sensor2)):
            if d1 == d2 or i + 1 == len(sensor1):
                continue
            if sensor1[i + 1] == d2:
                return 2
            else:
                return 1
        return -1
