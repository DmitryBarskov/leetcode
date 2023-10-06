class Node {
  val: number
  neighbors: Node[]
  constructor(val?: number, neighbors?: Node[]) {
      this.val = (val===undefined ? 0 : val)
      this.neighbors = (neighbors===undefined ? [] : neighbors)
  }
}

function cloneGraph(node: Node | null): Node | null {
  if (node === null) { return null; }

  const clonedNodes = new Map<Node, Node>();

  function cloneNode(node: Node): Node {
    if (clonedNodes.has(node)) { return clonedNodes.get(node)!!; }

    let clone = new Node(node.val, []);
    clonedNodes.set(node, clone);

    clone.neighbors = node.neighbors.map(cloneNode);
    return clone;
  }

  return cloneNode(node);
}
