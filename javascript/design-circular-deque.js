class MyCircularDeque {
    array;
    begin;
    size;

    /**
    * @param {number} k
    */
    constructor(k) {
        this.array = new Array(k);
        this.begin = 0;
        this.size = 0;
    }

    /** 
    * @param {number} value
    * @return {boolean}
    */
    insertFront(value) {
        if (this.isFull()) {
            return false;
        }
        this.array[this.begin] = value;
        this.begin = (this.begin - 1 + this.array.length) % this.array.length;
        this.size++;
        return true;
    }

    /** 
    * @param {number} value
    * @return {boolean}
    */
    insertLast(value) {
        if (this.isFull()) {
            return false;
        }
        this.size++;
        this.array[(this.begin + this.size) % this.array.length] = value;
        return true;
    }

    /**
    * @return {boolean}
    */
    deleteFront() {
        if (this.isEmpty()) {
            return false;
        }
        this.begin = (this.begin + 1) % this.array.length;
        this.array[this.begin] = null;
        this.size--;
        return true;
    }

    /**
    * @return {boolean}
    */
    deleteLast() {
        if (this.isEmpty()) {
            return false;
        }
        this.array[(this.begin + this.size) % this.array.length] = null;
        this.size--;
        return true;
    }

    /**
    * @return {number}
    */
    getFront() {
        return this.array[(this.begin + 1) % this.array.length] ?? -1;
    }

    /**
    * @return {number}
    */
    getRear() {
        return this.array[(this.begin + this.size) % this.array.length] ?? -1;
    }

    /**
    * @return {boolean}
    */
    isEmpty() {
        return this.size == 0;
    }

    /**
    * @return {boolean}
    */
    isFull() {
        return this.size == this.array.length;
    }
}

import { assertEquals } from "jsr:@std/assert";

Deno.test("size", () => {
    const queue = new MyCircularDeque(5);
    assertEquals(queue.isEmpty(), true);

    queue.insertFront(1);

    assertEquals(queue.getFront(), 1);
    assertEquals(queue.isEmpty(), false);
    assertEquals(queue.isFull(), false);
    assertEquals(queue.size, 1);

    queue.insertFront(2);
    assertEquals(queue.getFront(), 2);
    queue.insertFront(3);
    assertEquals(queue.getFront(), 3);
    queue.insertFront(4);
    assertEquals(queue.getFront(), 4);
    queue.insertFront(5);
    assertEquals(queue.getFront(), 5);

    assertEquals(queue.size, 5);
    assertEquals(queue.isFull(), true);

    queue.deleteFront();
    assertEquals(queue.size, 4);
    assertEquals(queue.getFront(), 4);
    assertEquals(queue.getRear(), 1);

    queue.deleteFront();
    assertEquals(queue.size, 3);
    assertEquals(queue.getFront(), 3);
    assertEquals(queue.getRear(), 1);

    queue.deleteLast();
    assertEquals(queue.size, 2);
    assertEquals(queue.getFront(), 3);
    assertEquals(queue.getRear(), 2);
});

Deno.test("example", () => {
    const myCircularDeque = new MyCircularDeque(3);
    assertEquals(myCircularDeque.insertLast(1), true);  // return True
    assertEquals(myCircularDeque.insertLast(2), true);  // return True
    assertEquals(myCircularDeque.insertFront(3), true); // return True
    assertEquals(myCircularDeque.insertFront(4), false); // return False, the queue is full.
    assertEquals(myCircularDeque.getRear(), 2);      // return 2
    assertEquals(myCircularDeque.isFull(), true);       // return True
    assertEquals(myCircularDeque.deleteLast(), true);   // return True
    assertEquals(myCircularDeque.insertFront(4), true); // return True
    assertEquals(myCircularDeque.getFront(), 4);     // return 4
});
