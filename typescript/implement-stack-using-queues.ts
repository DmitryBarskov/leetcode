// https://leetcode.com/problems/implement-stack-using-queues/description/

type LNode = { val: number | null, next: LNode | null };

class MyQueue {
  private first: LNode;
  private last: LNode;
  private length: number;

  constructor() {
    this.last = { next: null, val: null };
    this.first = { next: this.last, val: null };
    this.length = 0;
  }

  pushToBack(item: number) {
    this.last.val = item;
    this.last.next = { next: null, val: null };
    this.last = this.last.next;
    this.length++;
  }
  peek(): number | null {
    return this.first.next?.val ?? null;
  }
  popFromFront(): number | null {
    if (this.isEmpty()) {
      return null;
    }
    let popped = this.first.next!!;
    this.first.next = popped.next;
    this.length--;
    return popped.val;
  }
  size(): number {
    return this.length;
  }
  isEmpty(): boolean {
    return this.first.next === this.last;
  }
}

class MyStack {
  private queues: MyQueue[];
  private activeQueue: number;
  private topItem: number | null;

  constructor() {
    this.activeQueue = 0;
    this.queues = [new MyQueue(), new MyQueue()];
    this.topItem = null;
  }

  push(x: number): void {
    this.queues[this.activeQueue].pushToBack(x);
    this.topItem = x;
  }

  pop(): number | null {
    if (this.empty()) {
      return null;
    }
    let main = this.queues[this.activeQueue];
    let secondary = this.queues[1 - this.activeQueue];
    this.topItem = null;
    while (main.size() > 1) {
      let item = main.popFromFront();
      this.topItem ??= item;
      secondary.pushToBack(item!!);
    }
    this.activeQueue = 1 - this.activeQueue;
    return main.popFromFront();
  }

  top(): number | null {
    return this.topItem;
  }

  empty(): boolean {
    return this.queues.every(q => q.isEmpty());
  }
}
