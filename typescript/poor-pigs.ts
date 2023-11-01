// https://leetcode.com/problems/poor-pigs/

function poorPigs(
  buckets: number,
  minutesToDie: number,
  minutesToTest: number,
): number {
  return pigs(buckets, Math.trunc(minutesToTest / minutesToDie));
}

function pigs(buckets: number, tests: number): number {
  if (buckets <= 1) return 0;
  if (tests <= 0) return -1;
  if (tests >= buckets - 1) return 1;

  let base = Math.trunc(Math.pow(buckets - 1, 1 / (tests + 1)));
  while (Math.pow(tests + 1, base) < buckets) {
    base++;
  }
  return base;
}

import { assertEquals } from "std/assert/mod.ts";

Deno.test("example 1", () => {
  assertEquals(poorPigs(4, 15, 15), 2);
});

Deno.test("example 1", () => {
  assertEquals(poorPigs(4, 15, 30), 2);
});

Deno.test("more", () => {
  assertEquals(poorPigs(40, 15, 15), 6);
  assertEquals(poorPigs(24, 15, 45), 3);
  assertEquals(poorPigs(24, 3, 9), 3);
  assertEquals(poorPigs(125, 1, 4), 3);
});

Deno.test("even more", () => {
  assertEquals(poorPigs(3, 2, 4), 1);
  assertEquals(poorPigs(4, 2, 6), 1);
  assertEquals(poorPigs(7, 2, 8), 2);
  assertEquals(poorPigs(30, 3, 9), 3);
  assertEquals(poorPigs(1, 2, 20), 0);
});

Deno.test("reverse engineering", () => {
  const testCases: Array<[[number, number, number], number]> = [
    [[37, 1, 1], 6],
    [[38, 1, 1], 6],
    [[39, 1, 1], 6],
    [[17, 1, 2], 3],
    [[18, 1, 2], 3],
    [[19, 1, 2], 3],
    [[13, 1, 3], 2],
    [[14, 1, 3], 2],
  ];
  testCases.forEach(([args, expected]) => {
    assertEquals(poorPigs(...args), expected);
  });
});

Deno.test("more engineering", () => {
  const testCases: Array<[[number, number, number], number]> = [
    [[15, 1, 3], 2],
    [[11, 1, 4], 2],
    [[12, 1, 4], 2],
    [[13, 1, 4], 2],
    [[13, 2, 8], 2],
    [[13, 3, 12], 2],
    [[14, 1, 4], 2],
    [[15, 1, 5], 2],
    [[16, 1, 5], 2],
    [[17, 1, 5], 2],
  ];
  testCases.forEach(([args, expected]) => {
    assertEquals(poorPigs(...args), expected);
  });
});

Deno.test("pigs table", () => {
  const testCases = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [-1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [-1, 2, 1, 1, 1, 1, 1, 1, 1, 1], // 3 buckets
    [-1, 2, 2, 1, 1, 1, 1, 1, 1, 1],
    [-1, 3, 2, 2, 1, 1, 1, 1, 1, 1], // 5 buckets
    [-1, 3, 2, 2, 2, 1, 1, 1, 1, 1],
    [-1, 3, 2, 2, 2, 2, 1, 1, 1, 1], // 7 buckets
    [-1, 3, 2, 2, 2, 2, 2, 1, 1, 1],
    [-1, 4, 2, 2, 2, 2, 2, 2, 1, 1], // 9
    [-1, 4, 3, 2, 2, 2, 2, 2, 2], // 10
    [-1, 4, 3, 2, 2, 2, 2, 2, 2, 2],
    [-1, 4, 3, 2, 2, 2, 2, 2, 2, 2],
    [],
    [],
    [],
    [],
    [-1, 5, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1], // 17
    [-1, 5, 3, 3, 2, 2, 2, 2, 2], // 18
    [-1, 5, 3, 3, 2, 2, 2, 2, 2], // 19
    [-1, 5, 3, 3, 2, 2, 2, 2, 2], // 20
  ];
  // testCases[i, j] = pigs(i, j), i = number of buckets, j = tests

  for (let i = 0; i < testCases.length; i++) {
    for (let j = 0; j < testCases[i].length; j++) {
      assertEquals(
        pigs(i, j),
        testCases[i][j],
        `pigs(${i}, ${j}) = ${pigs(i, j)}, but ${testCases[i][j]} expected`,
      );
    }
  }
});
// 00, 01, 10, 11
