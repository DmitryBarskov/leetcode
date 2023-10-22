import { assertEquals } from "std/assert/mod.ts";
import { ListIterator, NestedInteger, NestedIterator } from "./flatten-nested-list-iterator.ts";

function iteratorToArray<T>(iterator: ListIterator<T>) {
  const array = new Array<T>();
  while (iterator.hasNext()) {
    array.push(iterator.next());
  }
  return array;
}

Deno.test("NestedIterator", () => {
  // [[1,1],2,[1,1]]
  const nestedIntegers = [
    new NestedInteger(),
    new NestedInteger(2),
    new NestedInteger()
  ];
  nestedIntegers[0].add(new NestedInteger(1));
  nestedIntegers[0].add(new NestedInteger(1));
  nestedIntegers[2].add(new NestedInteger(1));
  nestedIntegers[2].add(new NestedInteger(1));
  assertEquals(iteratorToArray(new NestedIterator(nestedIntegers)), [1, 1, 2, 1, 1]);
});
