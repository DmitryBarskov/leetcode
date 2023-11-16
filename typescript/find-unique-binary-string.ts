// @leetup=custom
// @leetup=info id=1980 lang=typescript slug=find-unique-binary-string

/*
 * Given an array of strings `nums` containing `n` unique binary strings each
 * of length `n`, return *a binary string of length *`n`* that does not appear
 * in *`nums`*. If there are multiple answers, you may return any of them*.
 *
 * Example 1:
 *
 * Input: nums = ["01","10"]
 * Output: "11"
 * Explanation: "11" does not appear in nums. "00" would also be correct.
 *
 * Example 2:
 *
 * Input: nums = ["00","01"]
 * Output: "11"
 * Explanation: "11" does not appear in nums. "10" would also be correct.
 *
 * Example 3:
 *
 * Input: nums = ["111","011","001"]
 * Output: "101"
 * Explanation: "101" does not appear in nums. "000", "010", "100", and "110" w
 * ould also be correct.
 *
 * Constraints:
 *
 * * `n == nums.length`
 * * `1 <= n <= 16`
 * * `nums[i].length == n`
 * * `nums[i] `is either `'0'` or `'1'`.
 * * All the strings of `nums` are unique.
 */
import { assertArrayIncludes } from "std/assert/mod.ts";

Deno.test("examples", () => {
  assertArrayIncludes(
    ["11", "00"],
    [findDifferentBinaryString(["01", "10"])],
  );
  assertArrayIncludes(
    ["11", "10"],
    [findDifferentBinaryString(["00", "01"])],
  );
  assertArrayIncludes(
    ["000", "010", "100", "101", "110"],
    [findDifferentBinaryString(["111", "011", "001"])],
  );
});

Deno.test("failed case", () => {
  assertArrayIncludes(
    ["00", "01"],
    [findDifferentBinaryString(["10", "11"])],
  );
});

Deno.test("my cases", () => {
  assertArrayIncludes(
    ["01", "10"],
    [findDifferentBinaryString(["11", "00"])],
  );
  assertArrayIncludes(
    ["11", "00"],
    [findDifferentBinaryString(["10", "01"])],
  );
});

findDifferentBinaryString(["111", "011", "001"]);
// @leetup=custom
// @leetup=code
function findDifferentBinaryString(nums: string[]): string {
  const diff = new Array(nums.length);
  nums.forEach((num, i) => {
    diff[i] = num[i] === "1" ? 0 : 1;
  });
  return diff.join("");
}
// @leetup=code
