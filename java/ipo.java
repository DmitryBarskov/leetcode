import java.util.*;

class Solution {
    public int findMaximizedCapital(int k, int w, int[] profits, int[] capital) {
        int currentCapital = w;
        PriorityQueue<Integer> availableProjects = new PriorityQueue<>((a, b) -> profits[b] - profits[a]);
        PriorityQueue<Integer> projectsOnHold = new PriorityQueue<>((a, b) -> capital[a] - capital[b]);
        for (int i = 0; i < profits.length; i++) {
            projectsOnHold.offer(i);
        }

        for (int i = 0; i < k; i++) {
            while (projectsOnHold.size() > 0 &&
                    capital[projectsOnHold.peek()] <= currentCapital) {
                availableProjects.offer(projectsOnHold.poll());
            }

            if (availableProjects.size() == 0) {
                break;
            }

            currentCapital += profits[availableProjects.poll()];
        }

        return currentCapital;
    }
}
