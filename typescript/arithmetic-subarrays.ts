// @leetup=custom
// @leetup=info id=1630 lang=typescript slug=arithmetic-subarrays

/*
 * A sequence of numbers is called arithmetic if it consists of at least two
 * elements, and the difference between every two consecutive elements is the same.
 * More formally, a sequence `s` is arithmetic if and only if `s[i+1] - s[i] ==
 * s[1] - s[0] `for all valid `i`.
 *
 * For example, these are arithmetic sequences:
 *
 * 1, 3, 5, 7, 9
 * 7, 7, 7, 7
 * 3, -1, -5, -9
 *
 * The following sequence is not arithmetic:
 *
 * 1, 1, 2, 5, 7
 *
 * You are given an array of `n` integers, `nums`, and two arrays of `m` integers
 * each, `l` and `r`, representing the `m` range queries, where the `ith` query is
 * the range `[l[i], r[i]]`. All the arrays are 0-indexed.
 *
 * Return *a list of *`boolean` *elements* `answer`*, where* `answer[i]` *is*
 * `true` *if the subarray* `nums[l[i]], nums[l[i]+1], ... , nums[r[i]]`* can be
 * rearranged to form an arithmetic sequence, and* `false` *otherwise.*
 *
 * Example 1:
 *
 * Input: nums = `[4,6,5,9,3,7]`, l = `[0,0,2]`, r = `[2,3,5]`
 * Output: `[true,false,true]`
 * Explanation:
 * In the 0th query, the subarray is [4,6,5]. This can be rearranged as [6,5,4], wh
 * ich is an arithmetic sequence.
 * In the 1st query, the subarray is [4,6,5,9]. This cannot be rearranged as an ari
 * thmetic sequence.
 * In the 2nd query, the subarray is `[5,9,3,7]. This` can be rearranged as `[3,5,7
 * ,9]`, which is an arithmetic sequence.
 *
 * Example 2:
 *
 * Input: nums = [-12,-9,-3,-12,-6,15,20,-25,-20,-15,-10], l = [0,1,6,4,8,7], r
 *  = [4,4,9,7,9,10]
 * Output: [false,true,false,false,true,true]
 *
 * Constraints:
 *
 * * `n == nums.length`
 * * `m == l.length`
 * * `m == r.length`
 * * `2 <= n <= 500`
 * * `1 <= m <= 500`
 * * `0 <= l[i] < r[i] < n`
 * * `-10^5 <= nums[i] <= 10^5`
 */
import { assertEquals } from "std/assert/mod.ts";

Deno.test("example 1", () => {
  assertEquals(
    checkArithmeticSubarrays([4, 6, 5, 9, 3, 7], [0, 0, 2], [2, 3, 5]),
    [true, false, true],
  );
});

Deno.test("example 2", () => {
  assertEquals(
    checkArithmeticSubarrays(
      [-12, -9, -3, -12, -6, 15, 20, -25, -20, -15, -10],
      [0, 1, 6, 4, 8, 7],
      [4, 4, 9, 7, 9, 10],
    ),
    [false, true, false, false, true, true],
  );
});

Deno.test("more cases", () => {
  assertEquals(
    checkArithmeticSubarrays([3, 72], [0, 0], [1, 1]),
    [true, true],
  );

  assertEquals(
    checkArithmeticSubarrays([-99, -58], [0, 0], [1, 1]),
    [true, true],
  );

  assertEquals(
    checkArithmeticSubarrays([60, 60], [0, 0], [1, 1]),
    [true, true],
  );

  assertEquals(
    checkArithmeticSubarray(
      [60,-49,-17,11,-59,-63,99,-35,-5,14,9,78,18,65,92,59,-58,28,85,86,-15,50,34,94,44,-76,-99,27,44,64,99,51,55,6,-80,-1,84,58,-18,7,-1,50,49,-41,21,-47,43,-3,-30,-100,100,24,97,-98,-95,-7,1,0,-12,56,-99,91,86,-72,-95,79,-94,-97,-55,-63,10,-34,-48,-6,45,-38,99,81,8,-1,-24,33,-61,-72,25,29,-49,-35,86,-61,-100,44,-29,-95,56,85,-97,87,-42,-2,95,12,64,70,69,-37,15,66,54,-39,-99,-91,-88,-49,-83,13,4,-59,-9,95,-86,-23,-98,-54,-20,22,39,77,-60,0,-36,48,-93,12,-18,56,24,-57,52,11,-96,-2,62,-76,83,12,49,-100,-22,82,9,65,73,10,-7,14,24,84,-30,96,-2,-16,-38,74,-97,32,-23,-36,31,12,-93,-23,3,-63,50,6,-37,48,-4,85,-94,72,98,-28,38,-35,24,17,68,79,-70,-1,9,24,-5,97,94,12,99,26,30],
      0, 200
    ),
    false
  );


  const array = [
    65,41,42,-89,-73,-47,-60,60,59,-59,70,-81,71,-16,-41,3,-9,48,91,-30,-52,-55,-11,23,-49,-3,-66,-86,-2,-40,83,40,-66,65,-37,90,-83,-69,11,-87,-13,-54,47,83,-97,48,-77,-63,-5,-1,-89,82,-7,-54,1,-19,-79,-16,-6,-86,-90,91,88,17,2,-50,30,23,-26,37,77,54,-23,22,-60,59,-51,-14,18,79,13,89,9,90,73,80,-31,64,-18,89,94,-26,-64,41,-34,67,20,62,-82,47,-36,56,49,-28,19,48,-29,42,-66,61,-39,-15,42,22,41,74,-57,-21,86,18,-15,-6,79,-2,-81,-42,-19,-45,-27,77,-95,58,-8,25,-58,49,35,-55,-6,33,33,48,23,-81,60,-49,-17,11,-59,-63,99,-35,-5,14,9,78,18,65,92,59,-58,28,85,86,-15,50,34,94,44,-76,-99,27,44,64,99,51,55,6,-80,-1,84,58,-18,7,-1,50,49,-41,21,-47,43,-3,-30,-100,100,24,97,-98,-95,-7,1,0,-12,56,-99,91,86,-72,-95,79,-94,-97,-55,-63,10,-34,-48,-6,45,-38,99,81,8,-1,-24,33,-61,-72,25,29,-49,-35,86,-61,-100,44,-29,-95,56,85,-97,87,-42,-2,95,12,64,70,69,-37,15,66,54,-39,-99,-91,-88,-49,-83,13,4,-59,-9,95,-86,-23,-98,-54,-20,22,39,77,-60,0,-36,48,-93,12,-18,56,24,-57,52,11,-96,-2,62,-76,83,12,49,-100,-22,82,9,65,73,10,-7,14,24,84,-30,96,-2,-16,-38,74,-97,32,-23,-36,31,12,-93,-23,3,-63,50,6,-37,48,-4,85,-94,72,98,-28,38,-35,24,17,68,79,-70,-1,9,24,-5,97,94,12,99,26,30,-31,-98,-15,-84,-18,-79,-86,28,35,-61,28,63,-51,0,-8,96,-16,-65,15,-52,41,23,21,36,91,-20,-82,-70,41,65,37,82,53,83,-12,-48,-89,56,-70,31,46,35,15,64,-95,54,72,7,-59,-50,-79,74,-13,31,-69,23,68,-46,-77,21,98,-47,-79,-91,-35,37,32,-55,42,-48,20,-48,2,-75,-5,-66,-27,-45,22,-65,-86,-81,-25,-97,-46,18,-40,1,-42,-91,-9,-40,-34,-65,35,-9,66,-16,13,53,-69,36,-37,31,38,75,94,11,-76,-56,8,65,-16,38,-86,55,56,98,-13,18,75,-61,-60,41,-88,-90,45,78,-35,35,-44,7,-82,10,-94,-34,49,7,-84,81,73,-30,99,76,67,85,-44,74,14,-23,-18,-46,-27,10,49
  ];
  const l = [
    54,258,291,12,130,207,433,461,246,105,303,487,385,21,18,217,186,442,349,482,487,243,127,434,26,465,238,247,148,340,312,111,427,468,312,204,315,208,54,405,414,459,323,287,245,319,387,473,243,142,104,148,372,421,294,348,407,14,151,310,33,15,20,382,273,165,244,153,26,491,118,337,80,8,482,201,33,185,460,386,25,165,490,168,405,188,131,71,178,260,171,120,32,117,383,327,287,268,282,307,189,39,491,397,268,339,108,278,198,469,103,377,407,24,292,405,245,243,369,141,87,491,420,83,142,19,312,335,131,256,324,175,193,411,451,45,347,470,474,471,496,169,151,26,494,480,323,38,361,185,5,75,45,182,163,132,61,254,398,135,333,155,315,95,392,69,239,470,368,94,418,21,335,477,41,138,401,272,404,252,117,186,421,171,228,88,163,4,52,162,82,475,227,78,255,438,368,21,153,324,225,104,156,282,344,228,275,399,250,428,3,456,363,396,246,376,269,145,292,349,59,210,289,67,461,365,385,161,473,20,327,43,429,348,417,57,60,117,146,37,279,351,382,207,406,320,147,480,397,346,5,420,218,422,336,461,5,95,185,449,226,418,109,354,361,383,433,457,50,425,389,1,170,264,40,378,131,197,405,314,229,109,21,415,251,280,180,390,216,491,398,101,375,140,472,166,51,400,327,97,403,139,211,103,193,359,245,33,211,346,368,474,317,308,181,234,263,156,478,444,274,377,211,459,136,158,121,4,399,75,346,164,41,332,479,91,292,437,240,474,209,360,486,201,360,151,357,103,328,306,77,349,466,445,268,324,429,273,263,456,32,15,288,380,491,162,488,484,37,432,239,259,243,165,235,262,27,350,194,301,351,265,157,15,85,336,109,441,88,446,441,113,290,21,218,363,229,98,5,149,71,424,401,454,266,382,149,127,409,428,425,130,170,308,390,486,487,433,43,170,142,93,387,396,331,380,257,383,121,55,166,48,128,295,122,111,466,412,264,427,155,81,261,204,115,8,372,147,468,463,304,92,129,208,16,94,13,304,154,82,316,163,318,335,144,53,209,216,424,268,337,235,261,196,10,367,400,29,213,465,246,432,257,296,367,418,315,348,405,113,429,255,325,81,265,78,454,460,345,140
  ];
  const r = [
    55,260,295,14,132,212,434,466,255,112,314,493,387,28,32,233,193,456,364,495,495,260,137,454,52,466,266,261,161,343,322,130,459,470,329,220,343,240,60,425,443,494,342,312,252,357,402,487,270,145,147,189,395,422,345,356,465,24,156,345,66,17,39,417,297,223,246,195,92,499,128,361,126,29,484,276,97,205,461,393,81,217,494,183,458,246,175,125,266,347,239,185,119,131,448,332,334,307,307,348,221,109,492,493,371,343,209,305,265,498,146,422,419,114,378,471,362,339,417,187,201,498,489,202,200,58,361,417,244,261,455,233,315,464,493,94,425,481,481,499,498,312,160,56,497,487,405,74,495,221,96,201,46,239,195,183,64,262,419,245,394,172,395,213,432,219,264,498,465,151,461,32,442,482,70,289,426,326,488,407,272,361,427,192,302,255,334,127,200,235,88,489,396,260,441,458,489,63,331,471,333,250,313,434,462,275,342,487,316,450,38,462,396,449,410,427,377,289,472,453,100,238,451,291,479,481,438,365,479,120,417,252,473,478,458,285,284,261,383,56,338,478,448,250,469,396,324,484,402,385,172,461,377,430,386,463,35,201,249,479,336,458,261,433,397,490,438,460,178,485,496,13,210,449,62,448,343,388,454,408,334,320,180,482,305,330,249,449,354,498,466,159,499,144,478,230,303,420,468,275,412,334,499,346,303,370,472,148,359,371,496,486,416,330,355,319,444,299,482,480,320,392,261,478,227,182,314,193,418,136,477,488,78,487,490,348,493,493,494,498,367,409,489,428,380,357,377,362,350,381,311,417,468,472,280,480,463,375,496,468,353,151,298,495,497,432,494,492,286,444,242,312,409,344,431,274,149,457,340,445,355,403,478,46,334,481,331,465,469,461,486,481,418,154,243,482,364,379,392,185,72,497,439,462,343,465,218,177,491,454,465,253,177,337,393,487,492,483,72,442,284,281,468,464,471,482,280,450,303,110,205,267,220,307,139,493,478,421,419,483,333,100,435,246,218,41,493,371,481,497,463,259,308,280,71,365,196,396,324,258,478,298,437,384,344,422,359,365,445,419,413,374,399,419,266,457,411,437,294,490,332,448,393,442,412,438,354,372,446,483,470,396,335,296,483,156,487,491,434,204
  ];
  const expected = [
    true,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false
  ];
  l.forEach((_, i) => {
    assertEquals(
      checkArithmeticSubarrays(array, [l[i]], [r[i]]),
      [expected[i]],
      `Comparison failed at l[${i}]=${l[i]}, r[${i}]=${r[i]}, array[${l[i]}..${r[i]}] = [${array.slice(l[i], r[i] + 1)}]`
    );
  });
  assertEquals(
    checkArithmeticSubarrays(array, l, r),
    expected
  );
});

// @leetup=custom
// @leetup=code

function checkArithmeticSubarrays(
  nums: number[],
  l: number[],
  r: number[],
): boolean[] {
  return l.map((_, i) => checkArithmeticSubarray(nums, l[i], r[i]));
}

function checkArithmeticSubarray(
  nums: number[],
  from: number,
  to: number,
): boolean {
  const count = to - from + 1;
  let max = nums[from];
  let min = nums[from];
  for (let i = from; i <= to; i++) {
    max = Math.max(max, nums[i]);
    min = Math.min(min, nums[i]);
  }
  const expectedStep = (max - min) / (count - 1);
  if (expectedStep === 0) {
    return true;
  }
  const present = new Array<boolean>(count);

  for (let i = from; i <= to; i++) {
    if ((nums[i] - min) % expectedStep !== 0) {
      return false;
    }
    const index = (nums[i] - min) / expectedStep;
    if (present[index]) {
      return false;
    }
    present[index] = true;
  }
  return present.every(Boolean);
}
// @leetup=code
