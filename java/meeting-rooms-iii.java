import java.util.*;

public class Main {
  public static void main(String[] args) {
    System.out.println(
      Solution.mostBooked(2, new int[][]{{0,10},{1,5},{2,7},{3,4}})
    );
    System.out.println(
      Solution.mostBooked(3, new int[][]{{1,20},{2,10},{3,5},{4,9},{6,8}})
    );
    System.out.println(
      Solution.mostBooked(
        4,
        new int[][]{{18,19},{3,12},{17,19},{2,13},{7,10}}
      )
    );
    System.out.println(
      Solution.mostBooked(
        5,
        new int[][]{{40,47},{7,16},{27,38},{16,43},{38,40},{2,25}}
      )
    );
  }
}

class Solution {
  static record ScheduledMeeting(int start, int duration) {
    public ScheduledMeeting reschedule(int newStart) {
      return new ScheduledMeeting(newStart, duration);
    }
    public int end() { return start + duration; }
    public String toString() {
      return String.format("{%d, %d}", start(), end());
    }
  }
  static record CurrentMeeting(int end, int room) {}

  public static int mostBooked(int n, int[][] meetings) {
    Queue<ScheduledMeeting> waitingMeetings =
      new PriorityQueue<>(Comparator.comparing(ScheduledMeeting::start));
    for (int[] meeting : meetings) {
      waitingMeetings.offer(
        new ScheduledMeeting(meeting[0], meeting[1] - meeting[0])
      );
    }

    Queue<CurrentMeeting> currentMeetings =
      new PriorityQueue<>(Comparator.comparing(CurrentMeeting::end));
    Queue<Integer> availableRooms = new PriorityQueue<>();
    for (int i = 0; i < n; i++) {
      availableRooms.offer(i);
    }

    int[] meetingsCount = new int[n]; // room number to total meetings

    int currentTime = 0;
    while (!waitingMeetings.isEmpty()) {
      ScheduledMeeting nextMeeting = waitingMeetings.poll();
      while (!currentMeetings.isEmpty() &&
            currentMeetings.peek().end() <= currentTime) {
        CurrentMeeting ended = currentMeetings.poll();
        availableRooms.offer(ended.room());
      }
      if (availableRooms.isEmpty()) {
        CurrentMeeting endingMeeting = currentMeetings.poll();
        currentTime = endingMeeting.end(); // wait a meeting to end
        availableRooms.offer(endingMeeting.room());
      }
      if (nextMeeting.start() < currentTime) {
        nextMeeting = nextMeeting.reschedule(currentTime);
      } else {
        currentTime = nextMeeting.start(); // wait a meeting to start
      }
      int room = availableRooms.poll();
      currentMeetings.offer(new CurrentMeeting(nextMeeting.end(), room));
      meetingsCount[room]++;
    }

    int roomWithMaxMeetings = 0;
    for (int i = 0; i < n; i++) {
      if (meetingsCount[i] > meetingsCount[roomWithMaxMeetings]) {
        roomWithMaxMeetings = i;
      }
    }
    return roomWithMaxMeetings;
  }
}
