class Node {
  val: number
  children: Node[]
  constructor(val?: number) {
      this.val = (val===undefined ? 0 : val)
      this.children = []
  }
}

export function traverse(root: Node, callback: (arg0: Node) => void): void {
  let stack: Array<Node> = [root];
  while (stack.length !== 0) {
    let node: Node = stack.pop()!!;
    callback(node);
    for (let i = node.children.length - 1; i >= 0; i--) {
      stack.push(node.children[i]);
    }
  }
}

/**
 * Definition for node.
 * class Node {
 *     val: number
 *     children: Node[]
 *     constructor(val?: number) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.children = []
 *     }
 * }
 */
function preorder(root: Node | null): number[] {
  if (root === null) {
    return [];
  }

  let order: Array<number> = [];

  traverse(root, (node) => {
    order.push(node.val);
  });

  return order;
};
