class TreeNode {
  val: number;
  left: TreeNode | null;
  right: TreeNode | null;

  constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
    this.val = val === undefined ? 0 : val;
    this.left = left === undefined ? null : left;
    this.right = right === undefined ? null : right;
  }

  static fromArray(array: Array<number | null>): TreeNode | null {
    if (array.length === 0 || array[0] === null) {
      return null;
    }

    const root = new TreeNode(array[0]);
    let previousRow: TreeNode[] = [root];

    let i = 1;
    while (i < array.length) {
      const currentRow: TreeNode[] = [];
      for (const node of previousRow) {
        if (array[i] !== null) {
          node.left = new TreeNode(array[i]!);
          currentRow.push(node.left);
        }
        i += 1;
        if (i >= array.length) {
          break;
        }

        if (array[i] !== null) {
          node.right = new TreeNode(array[i]!);
          currentRow.push(node.right);
        }
        i += 1;
      }
      previousRow = currentRow;
    }

    return root;
  }
}

export default TreeNode;
