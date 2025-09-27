import heapq


class Solution:
    """
    >>> Solution().leastInterval(tasks = ["A","A","A","B","B","B"], n = 2)
    8
    >>> Solution().leastInterval(tasks = ["A","C","A","B","D","B"], n = 1)
    6
    >>> Solution().leastInterval(tasks = ["A","A","A","B","B","B"], n = 3)
    10
    >>> Solution().leastInterval(["B","C","D","A","A","A","A","G"], 1)
    8
    """

    def leastInterval(self, tasks: list[str], n: int) -> int:
        current_time = 0
        priority_queue = []

        task_count = {}
        for task in tasks:
            if task not in task_count:
                task_count[task] = 0
            task_count[task] += 1

        for task, count in task_count.items():
            heapq.heappush(priority_queue, (-count, task, count, 0))

        cooldown = []

        while len(priority_queue) > 0 or len(cooldown) > 0:
            while len(cooldown) > 0 and cooldown[0][3] <= current_time:
                _key, task, count, _ = heapq.heappop(cooldown)
                if count <= 0:
                    continue
                heapq.heappush(
                    priority_queue,
                    (-count, task, count, current_time)
                )

            if len(priority_queue) <= 0:
                current_time = cooldown[0][3]
                continue

            _key, task, tasks_left, next_execution_time = heapq.heappop(priority_queue)
            if tasks_left <= 0:
                continue

            current_time = max(current_time, next_execution_time)

            if tasks_left > 1:
                heapq.heappush(
                    cooldown,
                    (
                        (current_time + n, 1 - tasks_left),
                        task, tasks_left - 1, current_time + n + 1
                    )
                )
            current_time += 1

        return current_time
