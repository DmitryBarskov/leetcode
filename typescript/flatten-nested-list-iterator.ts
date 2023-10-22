// https://leetcode.com/problems/flatten-nested-list-iterator/
/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     If value is provided, then it holds a single integer
 *     Otherwise it holds an empty nested list
 *     constructor(value?: number) {
 *         ...
 *     };
 *
 *     Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     isInteger(): boolean {
 *         ...
 *     };
 *
 *     Return the single integer that this NestedInteger holds, if it holds a single integer
 *     Return null if this NestedInteger holds a nested list
 *     getInteger(): number | null {
 *         ...
 *     };
 *
 *     Set this NestedInteger to hold a single integer equal to value.
 *     setInteger(value: number) {
 *         ...
 *     };
 *
 *     Set this NestedInteger to hold a nested list and adds a nested integer elem to it.
 *     add(elem: NestedInteger) {
 *         ...
 *     };
 *
 *     Return the nested list that this NestedInteger holds,
 *     or an empty list if this NestedInteger holds a single integer
 *     getList(): NestedInteger[] {
 *         ...
 *     };
 * };
 */
export class NestedInteger {
  private value: number | null;
  private values: NestedInteger[] = [];

  constructor(value: number | null = null) {
    this.value = value;
  }

  isInteger(): boolean {
    return this.value !== null;
  }

  getInteger(): number | null {
    return this.value ?? null;
  }
  setInteger(value: number) {
    this.value = value;
  }
  add(elem: NestedInteger) {
    if (this.isInteger()) {
      throw new Error("Cannot add items to integer");
    }
    this.values.push(elem);
  }
  getList(): NestedInteger[] {
    if (this.isInteger()) {
      throw new Error("Cannot transform integer to list");
    }
    return this.values;
  }
}

export interface ListIterator<T> {
  hasNext(): boolean;
  next(): T;
}

export class Single<T> implements ListIterator<T> {
  private value: T;
  private iterated: boolean;

  constructor(value: T) {
    this.value = value;
    this.iterated = false;
  }

  hasNext(): boolean {
    return !this.iterated;
  }

  next(): T {
    if (this.iterated) {
      throw new Error("Iteration is over.");
    }
    this.iterated = true;
    return this.value;
  }
}

export class NestedIterator implements ListIterator<number> {
  private stack = new Array<ListIterator<number>>();

  constructor(nestedList: NestedInteger[] | NestedInteger) {
    if (Array.isArray(nestedList)) {
      this.initializeFromList(nestedList);
    } else if (nestedList.isInteger()) {
      this.stack.push(new Single<number>(nestedList.getInteger()!!));
    } else {
      this.initializeFromList(nestedList.getList());
    }
  }

  hasNext(): boolean {
    try {
      this.lastStackItem();
      return true;
    } catch (err) {
      return false;
    }
  }

  next(): number {
    return this.lastStackItem().next();
  }

  private initializeFromList(nestedList: NestedInteger[]): void {
    for (let i = nestedList.length - 1; i >= 0; i--) {
      this.stack.push(new NestedIterator(nestedList[i]));
    }
  }

  private lastStackItem(): ListIterator<number> {
    while (this.stack.length > 0 && !this.stack[this.stack.length - 1].hasNext()) {
      this.stack.pop();
    }
    if (this.stack.length === 0) {
      throw new Error("No elements found");
    }
    return this.stack[this.stack.length - 1];
  }
}

/**
 * Your ParkingSystem object will be instantiated and called as such:
 * var obj = new NestedIterator(nestedList)
 * var a: number[] = []
 * while (obj.hasNext()) a.push(obj.next());
 */
