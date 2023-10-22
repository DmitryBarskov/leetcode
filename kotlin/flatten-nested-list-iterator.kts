import java.util.LinkedList

// https://leetcode.com/problems/flatten-nested-list-iterator/
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Constructor initializes an empty nested list.
 *     constructor()
 *
 *     // Constructor initializes a single integer.
 *     constructor(value: Int)
 *
 *     // @return true if this NestedInteger holds a single integer, rather than a nested list.
 *     fun isInteger(): Boolean
 *
 *     // @return the single integer that this NestedInteger holds, if it holds a single integer
 *     // Return null if this NestedInteger holds a nested list
 *     fun getInteger(): Int?
 *
 *     // Set this NestedInteger to hold a single integer.
 *     fun setInteger(value: Int): Unit
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     fun add(ni: NestedInteger): Unit
 *
 *     // @return the nested list that this NestedInteger holds, if it holds a nested list
 *     // Return null if this NestedInteger holds a single integer
 *     fun getList(): List<NestedInteger>?
 * }
 */

interface NestedInteger {
    // @return true if this NestedInteger holds a single integer, rather than a nested list.
    fun isInteger(): Boolean
    // @return the single integer that this NestedInteger holds, if it holds a single integer
    // Return null if this NestedInteger holds a nested list
    fun getInteger(): Int?
    // Set this NestedInteger to hold a single integer.
    fun setInteger(value: Int): Unit
    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
    fun add(ni: NestedInteger): Unit
    // @return the nested list that this NestedInteger holds, if it holds a nested list
    // Return null if this NestedInteger holds a single integer
    fun getList(): List<NestedInteger>?
}
// [[1,1],2,[1,1]]
// [1,[4,[6]]]

class NestedIterator {
    var stack = LinkedList<NestedIterator>()

    constructor(nestedList: List<NestedInteger>) {
        nestedList.reversed().forEach {
            stack.push(NestedIterator(it))
        }
    }

    constructor(nestedInteger: NestedInteger) {
        if (nestedInteger.isInteger()) {
            stack.push(NestedIterator(nestedInteger))
        } else {
            nestedInteger.getList()?.reversed()?.forEach {
                stack.push(NestedIterator(it))
            }
        }
    }

    fun next(): Int {
        if (!hasNext()) {
            throw IllegalStateException("No more items in iterator")
        }
        while (!stack.peek().hasNext()) {
            stack.pop()
        }
        return stack.peek().next()
    }

    fun hasNext(): Boolean {
        while (!stack.peek().hasNext()) {
            stack.pop()
        }
        return !stack.isEmpty() && stack.peek().hasNext()
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * var obj = NestedIterator(nestedList)
 * var param_1 = obj.next()
 * var param_2 = obj.hasNext()
 */
