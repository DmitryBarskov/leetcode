import 'dart:collection';

typedef RobotState = ({(int, int) position, (int, int) direction, int maxDistance});

class Solution {
  final TURN_LEFT = const {
    (0, 1): (-1, 0),
    (-1, 0): (0, -1),
    (0, -1): (1, 0),
    (1, 0): (0, 1)
  };
  // direction: (0, 1) -> (1, 0) -> (0, -1) -> (-1, 0) -> ...
  final TURN_RIGHT = const {
    (0, 1): (1, 0),
    (1, 0): (0, -1),
    (0, -1): (-1, 0),
    (-1, 0): (0, 1)
  };

  int robotSim(List<int> commands, List<List<int>> obstaclesArray) {
    final obstacles = HashMap<int, Set<int>>();
    obstaclesArray.forEach((point) {
      var [x, y] = point;
      obstacles.putIfAbsent(x, () => <int>{});
      obstacles[x]!.add(y);
    });
    return commands.fold<RobotState>(
      (position: (0, 0), direction: (0, 1), maxDistance: 0),
      (RobotState robot, int command) {
        if (command == -2) {
          return (position: robot.position, direction: TURN_LEFT[robot.direction]!, maxDistance: robot.maxDistance);
        }
        if (command == -1) {
          return (position: robot.position, direction: TURN_RIGHT[robot.direction]!, maxDistance: robot.maxDistance);
        }
        var (x, y) = robot.position;
        var maximum = robot.maxDistance;
        var (dx, dy) = robot.direction;
        for (int i = 0; i < command; i++) {
          var (nextX, nextY) = (x + dx, y + dy);
          if (obstacles[nextX]?.contains(nextY) ?? false) {
            break;
          }
          (x, y) = (nextX, nextY);
          maximum = max(maximum, x * x + y * y);
        }
        return (position: (x, y), direction: (dx, dy), maxDistance: maximum);
      }
    ).maxDistance;
  }
}
