function traverse(root: TreeNode | null, callback: (x: TreeNode) => void): void {
  if (root === null) {
    return;
  }
  traverse(root.left, callback);
  callback(root);
  traverse(root.right, callback);
}

function inorderTraversal(root: TreeNode | null): number[] {
  if (root === null) {
    return [];
  }

  let order: Array<number> = [];

  traverse(root, (node) => {
    order.push(node.val);
  });

  return order;
}
