#!/usr/bin/env deno test
import { assertEquals } from "std/assert/assert_equals.ts";

import TreeNode from "./TreeNode.ts";

Deno.test("TreeNode.fromArray", () => {
  assertEquals(
    TreeNode.fromArray([1, 2, 3]),
    new TreeNode(1, new TreeNode(2), new TreeNode(3)),
  );
  assertEquals(
    TreeNode.fromArray([1, null, 3]),
    new TreeNode(1, null, new TreeNode(3)),
  );
  assertEquals(
    TreeNode.fromArray([1, 2]),
    new TreeNode(1, new TreeNode(2)),
  );
  assertEquals(
    TreeNode.fromArray([1, 2, null, 3, null, null, 4]),
    new TreeNode(1, new TreeNode(2, new TreeNode(3, null, new TreeNode(4)))),
  );
});
