// https://leetcode.com/problems/design-hashmap/

type Entry = { key: number, value: number };

class MyHashMap {
  chunks: Array<Array<Entry>>;
  defaultValue: number;

  constructor() {
    this.chunks = new Array<Array<Entry>>(2048);
    this.defaultValue = -1;
  }

  put(lookupKey: number, value: number): void {
    const chunk = this.chunk(lookupKey);
    const indexOfKey = chunk.findIndex(({ key }) => key === lookupKey);
    if (indexOfKey === -1) {
      chunk.push({ key: lookupKey, value });
    } else {
      chunk[indexOfKey] = { key: lookupKey, value };
    }
  }

  get(lookupKey: number): number {
    return this.chunk(lookupKey).find(({ key }) => key === lookupKey)?.value ?? this.defaultValue;
  }

  remove(keyToRemove: number): void {
    const chunk = this.chunk(keyToRemove);
    const poppedIndex = chunk.findIndex(({ key }) => key === keyToRemove);
    if (poppedIndex === -1) {
      return;
    }
    chunk[poppedIndex] = chunk[chunk.length - 1];
    chunk.pop();
  }

  private hash(key: number): number {
    return key % this.chunks.length;
  }

  private chunk(key: number): Array<Entry> {
    return this.chunks[this.hash(key)] ??= new Array<Entry>();
  }
}
