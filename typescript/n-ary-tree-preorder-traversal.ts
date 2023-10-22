class Node {
  val: number
  children: Node[]
  constructor(val?: number) {
      this.val = (val===undefined ? 0 : val)
      this.children = []
  }
}

// https://leetcode.com/problems/n-ary-tree-preorder-traversal/description/

function traverse(root: Node, callback: (arg0: Node) => void): void {
  const stack: Array<Node> = [root];
  while (stack.length !== 0) {
    const node: Node = stack.pop()!;
    callback(node);
    for (let i = node.children.length - 1; i >= 0; i--) {
      stack.push(node.children[i]);
    }
  }
}

function preorder(root: Node | null): number[] {
  if (root === null) {
    return [];
  }

  const order: Array<number> = [];

  traverse(root, (node) => {
    order.push(node.val);
  });

  return order;
}
