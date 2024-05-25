type LinkedNode<T> = { val: T, next: LinkedNode<T> };

type End<T> = { val: T | null, next: End<T> | null };
type Begin<T> = { next: LinkedNode<T> | End<T> }

class LinkedList<T> {
  private begin: Begin<T>;
  private end: End<T>;
  private size: number;

  constructor() {
    this.end = { val: null, next: null };
    this.begin = { next: this.end };
    this.size = 0;
  }

  length() { return this.size; }

  append(val: T): LinkedNode<T> {
    const insertedNode = this.end;
    this.end.val = val;
    this.end.next = { val: null, next: null };
    this.end = this.end.next;
    this.size++;
    return insertedNode as LinkedNode<T>;
  }

  popFirst(): T {
    return this.delete(this.begin.next);
  }

  delete(node: LinkedNode<T> | End<T>): T {
    if (this.begin.next === this.end || node.next == null) {
      throw new Error("Cannot delete from empty list");
    }
    const deletedVal = node.val as T;
    if (node.next === this.end) {
      this.end = node;
    }
    node.val = node.next.val;
    node.next = node.next.next ?? null;
    this.size--;
    return deletedVal;
  }

  toString(): string {
    const values: string[] = [];
    let iter: LinkedNode<T> | End<T> | null = this.begin.next;
    while (iter !== this.end && iter != null) {
      values.push(JSON.stringify(iter.val));
      iter = iter.next;
    }
    return `[(${this.size}): -> ${values.join(" -> ")}]`;
  }
}

type Entry = { key: number, value: number };

// TODO: pass all the tests!
class LRUCache {
  private capacity: number;
  private order: LinkedList<Entry>;
  private map: Map<number, LinkedNode<Entry>>;

  constructor(capacity: number) {
    this.capacity = capacity;
    this.order = new LinkedList<Entry>();
    this.map = new Map<number, LinkedNode<Entry>>();
  }

  get(key: number): number {
    // console.log(this.toString());
    const val = this.delete(key);
    if (val == null) { return -1; }
    // console.log(this.toString());

    this.map.set(key, this.order.append({ key, value: val.value }));
    return val.value;
  }

  put(key: number, value: number): void {
    this.delete(key);

    this.map.set(key, this.order.append({ key, value }));

    while (this.order.length() > this.capacity) {
      let popped: Entry = this.order.popFirst();
      this.map.delete(popped.key);
    }
  }

  delete(key: number): Entry | null {
    if (!this.map.has(key)) { return null; }

    const node: LinkedNode<Entry> = this.map.get(key)!;
    const val = node.val!;

    this.map.delete(val.key);
    this.order.delete(node);

    return val;
  }

  toString(): string {
    return JSON.stringify({
      map: [...this.map].map(([k, v]) => `${k}: ${v.val.value}`),
      order: this.order.toString()
    });
  }
}

import { expect, test } from 'bun:test';

test("linked list", () => {
  const ll = new LinkedList<number>();

  expect(ll.toString()).toBe("[(0): -> ]");
  ll.append(3);
  expect(ll.toString()).toBe("[(1): -> 3]");
  ll.append(5);
  expect(ll.toString()).toBe("[(2): -> 3 -> 5]");
  ll.append(8);
  expect(ll.toString()).toBe("[(3): -> 3 -> 5 -> 8]");

  ll.popFirst();
  expect(ll.toString()).toBe("[(2): -> 5 -> 8]");
  ll.popFirst();
  expect(ll.toString()).toBe("[(1): -> 8]");
  ll.popFirst();
  expect(ll.toString()).toBe("[(0): -> ]");
  const first = ll.append(1);
  ll.append(2);
  const middle = ll.append(3);
  ll.append(4);
  const last = ll.append(5);
  expect(ll.toString()).toBe("[(5): -> 1 -> 2 -> 3 -> 4 -> 5]");

  ll.delete(first);
  expect(ll.toString()).toBe("[(4): -> 2 -> 3 -> 4 -> 5]");
  ll.delete(middle);
  expect(ll.toString()).toBe("[(3): -> 2 -> 4 -> 5]");
  ll.delete(last);
  expect(ll.toString()).toBe("[(2): -> 2 -> 4]");
  ll.append(6);
  expect(ll.toString()).toBe("[(3): -> 2 -> 4 -> 6]");
});

test("LRUCache", () => {
  const l = new LRUCache(3);

  l.put(1, 1);
  l.put(2, 2);
  l.put(3, 3);
  l.put(4, 4);

  expect(l.get(4)).toBe(4);
  expect(l.get(3)).toBe(3);
  expect(l.get(2)).toBe(2);
  expect(l.get(1)).toBe(-1);

  console.log("Putting 5");
  console.log(l.toString());
  l.put(5, 5);

  console.log(l.toString());
  expect(l.get(1)).toBe(-1);
  expect(l.get(2)).toBe(2);
  expect(l.get(3));
  expect(l.get(4));
  expect(l.get(5));
});
