class TreeNode<T> {
  val: T;
  left: TreeNode<T> | null;
  right: TreeNode<T> | null;

  constructor(val?: T, left?: TreeNode<T> | null, right?: TreeNode<T> | null) {
    this.val = val;
    this.left = (left===undefined ? null : left);
    this.right = (right===undefined ? null : right);
  }
}

export default TreeNode;
