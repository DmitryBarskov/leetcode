class LinkedNode {
  constructor(value, next = null) {
    this.value = value;
    this.next = next;
  }
}

class SortedSet {
  constructor() {
    this.keyToNode = new Map();
    this.tail = new LinkedNode("tail");
    this.head = new LinkedNode("head", this.tail);
  }

  add(key) {
    if (this.keyToNode.has(key)) {
      this.remove(key);
    }

    const newNode = this.tail;
    newNode.value = key;
    newNode.next = new LinkedNode("tail");
    this.tail = newNode.next;

    this.keyToNode.set(key, newNode);
  }

  remove(key) {
    const node = this.keyToNode.get(key);
    this.keyToNode.delete(key);

    if (node.next === this.tail) {
      this.tail = node;
    }
    node.value = node.next.value;
    node.next = node.next.next;
    this.keyToNode.set(node.value, node);
  }

  removeFirst() {
    const key = this.head.next.value;
    this.remove(this.head.next.value);
    return key;
  }

  toString() {
    return `SortedSet(${this.head}, ${[...this.keyToNode.keys()]})`;
  }
}

class LRUCache {
  constructor(capacity) {
    this.capacity = capacity;
    this.map = new Map();
    this.keyUsageOrder = new SortedSet();
  }

  get(key) {
    if (!this.map.has(key)) {
      return -1;
    }

    this.makeRecent(key);
    return this.map.get(key);
  }

  put(key, value) {
    while (!this.map.has(key) && this.map.size >= this.capacity) {
      const leastRecentlyUsedKey = this.keyUsageOrder.removeFirst();
      this.map.delete(leastRecentlyUsedKey);
    }

    this.map.set(key, value);
    this.keyUsageOrder.add(key);
  }

  makeRecent(key) {
    this.keyUsageOrder.add(key);
  }
}
