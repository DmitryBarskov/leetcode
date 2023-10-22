import java.util.*;

// https://leetcode.com/problems/flatten-nested-list-iterator/
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * public interface NestedInteger {
 *     // @return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public boolean isInteger();
 *     // @return the single integer that this NestedInteger holds, if it holds a single integer
 *     // Return null if this NestedInteger holds a nested list
 *     public Integer getInteger();
 *     // @return the nested list that this NestedInteger holds, if it holds a nested list
 *     // Return empty list if this NestedInteger holds a single integer
 *     public List<NestedInteger> getList();
 * }
 */

interface NestedInteger {
    // @return true if this NestedInteger holds a single integer, rather than a nested list.
    public boolean isInteger();
    // @return the single integer that this NestedInteger holds, if it holds a single integer
    // Return null if this NestedInteger holds a nested list
    public Integer getInteger();
    // @return the nested list that this NestedInteger holds, if it holds a nested list
    // Return empty list if this NestedInteger holds a single integer
    public List<NestedInteger> getList();
}


class SingleIterator implements Iterator<Integer> {
    private final int value;
    private boolean iterated;

    SingleIterator(int value) {
        this.value = value;
    }

    @Override
    public boolean hasNext() {
        return !iterated;
    }

    @Override
    public Integer next() {
        iterated = true;
        return value;
    }
}

class NestedIterator implements Iterator<Integer> {
    private final Deque<Iterator<Integer>> stack = new LinkedList<>();

    public NestedIterator(List<NestedInteger> nestedList) {
        initFromList(nestedList);
    }

    NestedIterator(NestedInteger nestedInteger) {
        if (nestedInteger.isInteger()) {
            stack.push(new SingleIterator(nestedInteger.getInteger()));
        } else {
            initFromList(nestedInteger.getList());
        }
    }

    @Override
    public Integer next() {
        while (!stack.isEmpty() && !stack.peek().hasNext()) {
            stack.pop();
        }
        if (!hasNext() || stack.isEmpty()) {
            throw new IllegalStateException("No more items in iterator");
        }
        return stack.peek().next();
    }

    @Override
    public boolean hasNext() {
        while (!stack.isEmpty() && !stack.peek().hasNext()) {
            stack.pop();
        }
        return !stack.isEmpty() && stack.peek().hasNext();
    }

    private void initFromList(List<NestedInteger> nestedList) {
        var reverseIter = nestedList.listIterator(nestedList.size() - 1);
        while (reverseIter.hasPrevious()) {
            stack.push(new NestedIterator(reverseIter.previous()));
        }
    }
}

public class FlattenNestedListIterator {
    public static void main(String[] args) {
        System.out.println(
                fromIterator(
                        new NestedIterator(

                        )
                )
        );
    }

    static List<Integer> fromIterator(Iterator<Integer> iterator) {
        var arrayList = new ArrayList<Integer>();
        iterator.forEachRemaining(arrayList::add);
        return arrayList;
    }
}

/*
 * Your NestedIterator object will be instantiated and called as such:
 * NestedIterator i = new NestedIterator(nestedList);
 * while (i.hasNext()) v[f()] = i.next();
 */