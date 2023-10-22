// https://leetcode.com/problems/evaluate-reverse-polish-notation/

type Operation = (a: number, b: number) => number;

type SupportedOperations = "+" | "-" | "*" | "/";

const OPERATIONS: { [key in SupportedOperations]: Operation } = {
  "+": (a: number, b: number) => a + b,
  "-": (a: number, b: number) => a - b,
  "*": (a: number, b: number) => a * b,
  "/": (a: number, b: number) => Math.trunc(a / b),
};

const parseToken = (token: string): Operation | number => {
  if (token in OPERATIONS) {
    return OPERATIONS[token as SupportedOperations];
  }
  return parseInt(token);
};

function evalRPN(tokens: string[]): number {
  const stack = new Array<number>();

  tokens.forEach((token) => {
    const v = parseToken(token);
    if (typeof v === "function") {
      if (stack.length < 2) {
        throw new Error(`Too few arguments applied to ${token}`);
      }
      const lastArg = stack.pop()!;
      stack.push(v(stack.pop()!, lastArg));
    } else {
      stack.push(v);
    }
  });

  return stack[0];
}

import { assertEquals } from "std/assert/assert_equals.ts";

Deno.test("examples", () => {
  assertEquals(evalRPN(["2", "1", "+", "3", "*"]), 9);
  assertEquals(evalRPN(["4", "13", "5", "/", "+"]), 6);
  assertEquals(
    evalRPN(
      ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"],
    ),
    22,
  );
});
// ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
// [10, 6, 9, 3, :+, -11, :*, :/, :*, 17, :+, 5, :+]
// [10, 6, 9, 3] :+
// [10, 6, 12] -11
// [10, 6, 12, -11] :*
// [10, 6, -132] :/
// [10, 0] :*
// [0] 17
// [0, 17] :+
// [17] 5
// [17, 5] +
// [22]

Deno.test("minus", () => {
  assertEquals(evalRPN(["4", "-2", "/", "2", "-3", "-", "-"]), -7);
});
