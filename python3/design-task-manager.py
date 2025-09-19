import heapq

class TaskManager:
    def __init__(self, tasks: list[list[int]]):
        self.tasks = []
        self.task_priorities = {}
        self.task_to_user = {}
        for user_id, task_id, priority in tasks:
            self.add(user_id, task_id, priority)
        
    def add(self, userId: int, taskId: int, priority: int) -> None:
        self.edit(taskId, priority)
        self.task_to_user[taskId] = userId

    def edit(self, taskId: int, newPriority: int) -> None:
        heapq.heappush(
            self.tasks,
            ((-newPriority, -taskId), taskId, newPriority)
        )
        self.task_priorities[taskId] = newPriority

    def rmv(self, taskId: int) -> None:
        self.task_priorities.pop(taskId)
        self.task_to_user.pop(taskId)

    def execTop(self) -> int:
        while len(self.tasks) > 0:
            _key, top_task, priority = heapq.heappop(self.tasks)
            if self.task_priorities.get(top_task) == priority:
                user_id = self.task_to_user[top_task]
                self.rmv(top_task)
                return user_id
        return -1
