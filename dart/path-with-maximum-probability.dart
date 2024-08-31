import 'package:collection/collection.dart';

class Solution {
  double maxProbability(int n, List<List<int>> edges, List<double> succProb, int startNode, int endNode) {
    var graph = List<List<(int, double)>>.generate(n, (_) => [], growable: false);
    for (int i = 0; i < edges.length; i++) {
      var from = edges[i][0];
      var to = edges[i][1];
      var prob = succProb[i];
      graph[from].add((to, prob));
      graph[to].add((from, prob));
    }
    return dijkstra(graph, startNode, endNode);
  }

  double dijkstra(List<List<(int, double)>> graph, int from, int to) {
    var queue = PriorityQueue<(int, double)>((a, b) => b.$2.compareTo(a.$2));
    queue.add((from, 1.0));
    var visited = <int>{};
    while (!queue.isEmpty) {
      var (node, probability) = queue.removeFirst();
      if (node == to) {
        return probability;
      }
      if (visited.contains(node)) { continue; }

      visited.add(node);
      graph[node].forEach(((int, double) edge) {
        queue.add((edge.$1, probability * edge.$2));
      });
    }
    return 0.0;
  }
}