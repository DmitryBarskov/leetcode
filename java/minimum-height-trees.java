// @leetup=custom
// @leetup=info id=310 lang=java slug=minimum-height-trees

/*
* A tree is an undirected graph in which any two vertices are connected by exactly
* one path. In other words, any connected graph without simple cycles is a tree.
* 
* Given a tree of `n` nodes labelled from `0` to `n - 1`, and an array of `n - 1`
* `edges` where `edges[i] = [ai, bi]` indicates that there is an undirected edge
* between the two nodes `ai` and `bi` in the tree, you can choose any node of the
* tree as the root. When you select a node `x` as the root, the result tree has
* height `h`. Among all possible rooted trees, those with minimum height (i.e.
* `min(h)`) are called minimum height trees (MHTs).
* 
* Return *a list of all MHTs' root labels*. You can return the answer in any
* order.
* 
* The height of a rooted tree is the number of edges on the longest downward
* path between the root and a leaf.
* 
* 
* Example 1:
* 
* Input: n = 4, edges = [[1,0],[1,2],[1,3]]
* Output: [1]
* Explanation: As shown, the height of the tree is 1 when the root is the node
*  with label 1 which is the only MHT.
* 
* Example 2:
* 
* Input: n = 6, edges = [[3,0],[3,1],[3,2],[3,4],[5,4]]
* Output: [3,4]
* 
* 
* Constraints:
* 
* * `1 <= n <= 2 * 10^4`
* * `edges.length == n - 1`
* * `0 <= ai, bi < n`
* * `ai != bi`
* * All the pairs `(ai, bi)` are distinct.
* * The given input is guaranteed to be a tree and there will be no
*   repeated edges.
* 
*/
import java.util.AbstractMap.SimpleEntry;
import java.util.function.*;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        var graph = new Solution().findMinHeightTrees(
            4,
            new int[][]{
                new int[]{1, 0}, new int[]{1, 2}, new int[]{1, 3}
            }
        );
        System.out.println(graph);
    }
}
// @leetup=custom
// @leetup=code

class Solution {
    public static List<Integer> findMinHeightTrees(int n, int[][] edges) {
        ArrayList<ArrayList<Integer>> graph = graphFromEdges(n, edges);
				List<Integer> leaves = findLeaves(graph);
        int targetHeight = (findGraphBreadth(graph, leaves.get(0)) + 1) / 2;
				System.out.println(targetHeight);
        List<Integer> rootCandidates = leaves.stream().flatMap(leaf -> findRoot(graph, leaf, targetHeight).stream()).sorted().distinct().toList();
				System.out.println(rootCandidates);
        Map<Integer, List<Integer>> byLevels = new HashMap<>();
        int minHeight = n;
        for (int i = 0; i < n; i++) {
            int depth;
            try {
                final int stopSearchAt = minHeight + 1;
                depth = bfsReduce(graph, i, (_depth, level) -> {
                    if (level >= stopSearchAt) {
                        throw new RuntimeException("Stop searching");
                    }
                    return level;
                }, 0);
            } catch (RuntimeException e) {
                depth = minHeight + 2;
            }
            byLevels.computeIfAbsent(depth, (k) -> new ArrayList<>());
            byLevels.get(depth).add(i);
            if (depth < minHeight) {
                minHeight = depth;
            }
        }
        return byLevels.get(minHeight);
    }

    static ArrayList<ArrayList<Integer>> graphFromEdges(int n, int[][] edges) {
        ArrayList<ArrayList<Integer>> graph = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            graph.add(new ArrayList<>());
        }
        for (int[] edge : edges) {
            int a = edge[0];
            int b = edge[1];
            graph.get(a).add(b);
            graph.get(b).add(a);
        }
        return graph;
    }

		static List<Integer> findLeaves(ArrayList<ArrayList<Integer>> graph) {
        List<Integer> leaves = new ArrayList<>();
        for (int i = 0; i < graph.size(); i++) {
            if (graph.get(i).size() == 1) {
                leaves.add(i);
            }
        }
        return leaves;
		}

    static int findGraphBreadth(ArrayList<ArrayList<Integer>> graph, int aLeaf) {
        return bfsReduce(graph, aLeaf, (breadth, level) -> {
            return Math.max(breadth, level);
        }, 0) + 1;
    }

    static List<Integer> findRoot(ArrayList<ArrayList<Integer>> graph, int aLeaf, int treeHight) {
        Deque<Map.Entry<Integer, Integer>> queue = new ArrayDeque<>();
        Set<Integer> visited = new HashSet<>();
        queue.offer(new SimpleEntry<>(1, aLeaf));
        ArrayList<Integer> roots = new ArrayList<>();
        while (!queue.isEmpty()) {
            var entry = queue.poll();
            int level = entry.getKey();
            int currentNode = entry.getValue();
            if (visited.contains(currentNode)) {
                continue;
            }
            if (level == treeHight) {
                roots.add(currentNode);
                continue;
            }
            if (level > treeHight) {
                continue;
            }
            visited.add(currentNode);

            graph.get(currentNode).forEach(adjacent -> {
                queue.offer(new SimpleEntry<>(level + 1, adjacent));
            });
        }
        return roots;
    }

    static int bfsReduce(List<? extends List<Integer>> graph, int root, BiFunction<Integer, Integer, Integer> callback, int initialState) {
        Deque<Map.Entry<Integer, Integer>> queue = new ArrayDeque<>();
        Set<Integer> visited = new HashSet<>();
        queue.offer(new SimpleEntry<>(0, root));
        int state = 0;
        while (!queue.isEmpty()) {
            var entry = queue.poll();
            int level = entry.getKey();
            int currentNode = entry.getValue();
            if (visited.contains(currentNode)) {
                continue;
            }
            visited.add(currentNode);
            state = callback.apply(state, level);

            graph.get(currentNode).forEach(adjacent -> {
                queue.offer(new SimpleEntry<>(level + 1, adjacent));
            });
        }
        return state;
    }
}
// @leetup=code
