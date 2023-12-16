// @leetup=custom
// @leetup=info id=295 lang=java slug=find-median-from-data-stream

/*
* The median is the middle value in an ordered integer list. If the size of
* the list is even, there is no middle value, and the median is the mean of the
* two middle values.
* 
* * For example, for `arr = [2,3,4]`, the median is `3`.
* * For example, for `arr = [2,3]`, the median is `(2 + 3) / 2 = 2.5`.
* 
* Implement the MedianFinder class:
* 
* * `MedianFinder()` initializes the `MedianFinder` object.
* * `void addNum(int num)` adds the integer `num` from the data stream to the data
*   structure.
* * `double findMedian()` returns the median of all elements so far. Answers
*   within `10-5` of the actual answer will be accepted.
* 
* 
* Example 1:
* 
* Input
* ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
* [[], [1], [2], [], [3], []]
* Output
* [null, null, null, 1.5, null, 2.0]
* 
* Explanation
* MedianFinder medianFinder = new MedianFinder();
* medianFinder.addNum(1);    // arr = [1]
* medianFinder.addNum(2);    // arr = [1, 2]
* medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
* medianFinder.addNum(3);    // arr[1, 2, 3]
* medianFinder.findMedian(); // return 2.0
* 
* 
* Constraints:
* 
* * `-105 <= num <= 105`
* * There will be at least one element in the data structure before calling
*   `findMedian`.
* * At most `5 * 104` calls will be made to `addNum` and `findMedian`.
* 
* 
* Follow up:
* 
* * If all integer numbers from the stream are in the range `[0, 100]`, how would
*   you optimize your solution?
* * If `99%` of all integer numbers from the stream are in the range `[0, 100]`,
*   how would you optimize your solution?
* 
*/
import java.util.*;

public class Main {
    public static void main(String[] args) {
        MedianFinder medianFinder = new MedianFinder();
        medianFinder.addNum(6);
        System.out.println(medianFinder);
        medianFinder.addNum(10);
        System.out.println(medianFinder);
        medianFinder.addNum(2);
        System.out.println(medianFinder);
        medianFinder.addNum(6);
        System.out.println(medianFinder);
        medianFinder.addNum(5);
        System.out.println(medianFinder);
        medianFinder.addNum(0);
        System.out.println(medianFinder);
        medianFinder.addNum(6);
        System.out.println(medianFinder);
        medianFinder.addNum(3);
        System.out.println(medianFinder);
        medianFinder.addNum(1);
        System.out.println(medianFinder);
        medianFinder.addNum(0);
        System.out.println(medianFinder);
    }
}
// @leetup=custom
// @leetup=code

final class Heap {
    private final ArrayList<Integer> array;
    private final Comparator<Integer> comparator;

    public Heap(Comparator<Integer> comparator) {
        this.array = new ArrayList<>();
        this.comparator = comparator;
    }

    public int top() {
        return this.array.get(0);
    }

    public int size() {
        return this.array.size();
    }

    public int removeTop() {
        int top = top();
        array.set(0, array.get(size() - 1));
        array.remove(size() - 1);
        siftDown(0);
        return top;
    }

    public void insert(int value) {
        array.add(value);
        siftUp(size() - 1);
    }

    private void siftUp(int fromIndex) {
        int i = fromIndex;
        while (compareAt(i, (i - 1) / 2) < 0) {
            swap(i, (i - 1) / 2);
            i = (i - 1) / 2;
        }
    }

    private void siftDown(int fromIndex) {
        int current = fromIndex;
        while (2 * current + 1 < size()) {
            int left = 2 * current + 1;
            int right = 2 * current + 2;
            int leastChild = left;
            if (right < size() && compareAt(right, left) < 0) {
                leastChild = right;
            } else {
                leastChild = left;
            }
            if (compareAt(current, leastChild) <= 0) {
                break;
            }
            swap(current, leastChild);
            current = leastChild;
        }
    }

    private void swap(int index1, int index2) {
        int temp = array.get(index1);
        array.set(index1, array.get(index2));
        array.set(index2, temp);
    }

    private int compareAt(int i1, int i2) {
        return comparator.compare(array.get(i1), array.get(i2));
    }

    @Override
    public String toString() {
        return array.toString();
    }
}

class MedianFinder {
    private final Heap lteMedian;
    private final Heap gtMedian;

    public MedianFinder() {
        this.lteMedian = new Heap((a, b) -> b - a);
        this.gtMedian = new Heap((a, b) -> a - b);
    }
    
    public void addNum(int num) {
        if (lteMedian.size() == 0 && gtMedian.size() == 0) {
            lteMedian.insert(num);
            return;
        }

        if (num <= findMedian()) {
            lteMedian.insert(num);
            while (lteMedian.size() > gtMedian.size()) {
                gtMedian.insert(lteMedian.removeTop());
            }
        } else {
            gtMedian.insert(num);
            while (gtMedian.size() > lteMedian.size()) {
                lteMedian.insert(gtMedian.removeTop());
            }
        }
    }
    
    public double findMedian() {
        if (gtMedian.size() == lteMedian.size()) {
            return (gtMedian.top() + lteMedian.top()) / 2.0;
        } else if (gtMedian.size() > lteMedian.size()) {
            return gtMedian.top();
        } else {
            return lteMedian.top();
        }
    }

    @Override
    public String toString() {
        return findMedian() + " -> (" + lteMedian + " + " + gtMedian + ")";
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder obj = new MedianFinder();
 * obj.addNum(num);
 * double param_2 = obj.findMedian();
 */
// @leetup=code
