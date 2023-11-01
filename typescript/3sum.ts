// https://leetcode.com/problems/3sum/description/

type Triplet = [number, number, number];

const asc = (a: number, b: number) => a - b;

function threeSum(nums: number[]): Triplet[] {
  let zeroes = 0;
  const negatives = new Map<number, number>();
  const positives = new Map<number, number>();

  for (let i = 0; i < nums.length; i++) {
    if (nums[i] === 0) {
      zeroes++;
    } else if (nums[i] > 0) {
      positives.set(nums[i], (positives.get(nums[i]) ?? 0) + 1);
    } else {
      negatives.set(nums[i], (negatives.get(nums[i]) ?? 0) + 1);
    }
  }

  const triplets = new Array<Triplet>();
  if (zeroes >= 3) {
    triplets.push([0, 0, 0]);
  }

  positives.forEach((count, num) => {
    if (zeroes > 0 && negatives.has(-num)) {
      triplets.push([-num, 0, num]);
    }
    if (count > 1 && negatives.has(-2 * num)) {
      triplets.push([-2 * num, num, num]);
    }
    if (num % 2 === 0 && (negatives.get(-num / 2) ?? 0) > 1) {
      triplets.push([-num / 2, -num / 2, num]);
    }

    positives.forEach((_, otherPositive) => {
      if (otherPositive === num) return;

      if (negatives.has(-num - otherPositive)) {
        triplets.push([-num - otherPositive, num, otherPositive].sort(asc) as Triplet);
      }
    });

    negatives.forEach((_, negative) => {
      if (-num === negative) return;

      const complement = -(num + negative);

      if (complement === num || complement === negative) return;

      if (complement > 0 && positives.has(complement)) {
        triplets.push([negative, complement, num].sort(asc) as Triplet);
      }
      if (complement < 0 && negatives.has(complement)) {
        triplets.push([negative, complement, num].sort(asc) as Triplet);
      }
    });
  });
  return [
    ...new Set(
      triplets.map((tr) => tr.join(",")),
    ),
  ].map((tr) => tr.split(",").map((x) => parseInt(x)) as Triplet);
}

import { assertArrayIncludes, assertEquals } from "std/assert/mod.ts";

Deno.test("examples", () => {
  const testCases: {
    args: number[];
    expected: Triplet[];
    actual?: Triplet[];
  }[] = [
    // { args: [-1, 0, 1, 2, -1, -4], expected: [[-1, -1, 2], [-1, 0, 1]] },
    // { args: [0, 1, 1], expected: [] },
    // { args: [0, 0, 0], expected: [[0, 0, 0]] },
    // { args: [1, 1, -2], expected: [[-2, 1, 1]] },
    {
      args: [3, 0, -2, -1, 1, 2],
      expected: [[-2, -1, 3], [-2, 0, 2], [-1, 0, 1]],
    },
    {
      args: [-1, 0, 1, 2, -1, -4, -2, -3, 3, 0, 4],
      expected: [
        [-1, -1, 2],
        [-1, 0, 1],
        [-2, -1, 3],
        [-2, 0, 2],
        [-3, -1, 4],
        [-3, 0, 3],
        [-3, 1, 2],
        [-4, 0, 4],
        [-4, 1, 3],
      ],
      actual: [
        [-1, -1, 2],
        [-1, 0, 1],
        [-2, -1, 3],
        [-2, 0, 2],
        [-3, -1, 4],
        [-3, 0, 3],
        [-3, 1, 2],
        [-3, 2, 1],
        [-4, 0, 4],
        [-4, 1, 3],
        [-4, 3, 1],
      ],
    },
  ];

  testCases.forEach(({ args, expected }) => {
    const actual = threeSum(args);

    assertArrayIncludes(
      actual,
      expected,
      `Expected to include ${expected}, but threeSum(${args}) = ${actual}`,
    );
    assertEquals(
      actual.length,
      expected.length,
      `Expected to include ${expected.join(";")}, but threeSum(${args}) = ${
        actual.join(";")
      }`,
    );
  });
});

type Case = { input: number[]; expected: Triplet[] };
type Cases = { large_example: Case; zeroes: Case };

const cases: Cases = JSON.parse(
  Deno.readTextFileSync(
    new URL(".", import.meta.url).pathname + "../fixtures/3sum.json",
  ),
);

Deno.test("lot of zeroes", () => {
  assertArrayIncludes(
    threeSum(cases.zeroes.input),
    cases.zeroes.expected,
  );
});

// Deno.test("large", () => {
//   assertArrayIncludes(
//     threeSum(cases.large_example.input),
//     cases.large_example.expected,
//   );
// });
