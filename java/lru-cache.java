// @leetup=custom
// @leetup=info id=146 lang=java slug=lru-cache

/*
* Design a data structure that follows the constraints of a [Least Recently Used
* (LRU) cache][1].
* 
* Implement the `LRUCache` class:
* 
* * `LRUCache(int capacity)` Initialize the LRU cache with positive size
*   `capacity`.
* * `int get(int key)` Return the value of the `key` if the key exists, otherwise
*   return `-1`.
* * `void put(int key, int value)` Update the value of the `key` if the `key`
*   exists. Otherwise, add the `key-value` pair to the cache. If the number of
*   keys exceeds the `capacity` from this operation, evict the least recently
*   used key.
* 
* The functions `get` and `put` must each run in `O(1)` average time complexity.
* 
* 
* Example 1:
* 
* Input
* ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
* [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
* Output
* [null, null, null, 1, null, -1, null, -1, 3, 4]
* 
* Explanation
* LRUCache lRUCache = new LRUCache(2);
* lRUCache.put(1, 1); // cache is {1=1}
* lRUCache.put(2, 2); // cache is {1=1, 2=2}
* lRUCache.get(1);    // return 1
* lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
* lRUCache.get(2);    // returns -1 (not found)
* lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
* lRUCache.get(1);    // return -1 (not found)
* lRUCache.get(3);    // return 3
* lRUCache.get(4);    // return 4
* 
* 
* Constraints:
* 
* * `1 <= capacity <= 3000`
* * `0 <= key <= 104`
* * `0 <= value <= 105`
* * At most `2 * 105` calls will be made to `get` and `put`.
* 
* [1]: https://en.wikipedia.org/wiki/Cache_replacement_policies#LRU
* 
*/
import java.util.*;

public class Main {
    public static void main(String[] args) {
        LRUCache lRUCache = new LRUCache(2);
        lRUCache.put(1, 1); // cache is {1=1}
        lRUCache.put(2, 2); // cache is {1=1, 2=2}
        println(lRUCache.get(1));    // return 1
        lRUCache.put(3, 3); // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
        println(lRUCache.get(2));    // returns -1 (not found)
        lRUCache.put(4, 4); // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
        println(lRUCache.get(1));    // return -1 (not found)
        println(lRUCache.get(3));    // return 3
        println(lRUCache.get(4));    // return 4
        println("=============");
        lRUCache = new LRUCache(2);
        lRUCache.put(2, 1);
        lRUCache.put(1, 1);
        println(lRUCache.get(2) + " => 1");
        lRUCache.put(4, 1);
        println(lRUCache.get(1) + " => -1");
        println(lRUCache.get(2) + " => 1");
    }
    static void println(Object obj) {
        System.out.println(obj);
    }
}
// @leetup=custom
// @leetup=code

// TODO: debug and fix
class LRUCache {
    private final HashMap<Integer, Integer> keyToLastAccess;
    private final HashMap<Integer, Integer> keyToValue;
    private int currentTime;
    private final int capacity;

    public LRUCache(int capacity) {
        this.capacity = capacity;
        this.currentTime = 0;
        this.keyToLastAccess = new HashMap<>();
        this.keyToValue = new HashMap<>();
    }
    
    public int get(int key) {
        if (!keyToValue.containsKey(key)) {
            return -1;
        }
        System.out.println("Getting " + key + "" + "" + " it's age is " + keyAge(key) + ", " + this);
        if (keyAge(key) >= this.capacity) {
            keyToLastAccess.remove(key);
            keyToValue.remove(key);
            return -1;
        }
        keyToLastAccess.put(key, currentTime);
        this.currentTime++;
        System.out.println("After get(" + key + ") => " + this);
        return keyToValue.get(key);
    }
    
    public void put(int key, int value) {
        this.currentTime++;
        keyToLastAccess.put(key, this.currentTime);
        keyToValue.put(key, value);
        System.out.println("put(" + key + ", " + value + ") => " + this);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("{ ");
        keyToValue.forEach((key, value) -> {
            sb.append(key);
            sb.append("(");
            sb.append(keyAge(key));
            sb.append(")");
            sb.append(": ");
            sb.append(value);
            sb.append(", ");
        });
        sb.append(" }");
        return sb.toString();
    }

    private int keyAge(int key) {
        return this.currentTime - this.keyToLastAccess.get(key);
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * LRUCache obj = new LRUCache(capacity);
 * int param_1 = obj.get(key);
 * obj.put(key,value);
 */
// @leetup=code
