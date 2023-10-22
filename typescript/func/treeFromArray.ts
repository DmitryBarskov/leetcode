
import TreeNode from './TreeNode.ts';

function treeFromArray<T>(array: Array<T | null>, from: number = 0, to: number = 0): TreeNode<T> | null {
  if (from >= array.length || array[from] === null) { return null };

  const root = new TreeNode(array[from]);
  root.left = treeFromArray(array, from * 2 + 1);
  root.right = treeFromArray(array, from * 2 + 2);

  return root;
}

export default treeFromArray;

let arr = [1,2,2,3,null,null,3,4,null,null,4];
console.debug(treeFromArray<number>(arr));
