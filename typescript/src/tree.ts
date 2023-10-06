export type TreeNode<T> = {
  value: T | null,
  left: TreeNode<T> | null,
  right: TreeNode<T> | null,
};

/**
 *
 * @param array [5,3,6,2,4,null,8,1,null,null,null,7,9]
 * @param nodeConstructor
 * @returns
 *          5
 *        /  \
 *       3    6
 *     /  \    \
 *    2    4    8
 *  /          / \
 * 1          7   9
 */
const buildTree = <T, N>(array: Array<T>, nodeConstructor: (arg0: T, arg1: N, arg2: N) => N) => {
  let root: TreeNode<T> = { value: null, left: null, right: null };
  let nodes: Array<TreeNode<T> | null> = [root];
  for (let i = 0; i < array.length; i++) {
    let currentNode = nodes.shift()!!;
    if ((currentNode === null || currentNode === undefined) && array[i] !== null) {
      throw new Error(`Invalid tree in array argument! array = ${array}; i = ${i}, array[i] = ${array[i]}, nodes = ${JSON.stringify(nodes)}`);
    }
    currentNode.value = array[i];
    if (array[i * 2] !== null && array[i * 2] !== undefined) {
      currentNode.left = { value: array[i * 2], left: null, right: null };
      nodes.push(currentNode.left);
    } else {
      nodes.push(null);
    }
    if (array[i * 2 + 1] !== null && array[i * 2 + 1] !== undefined) {
      currentNode.right = { value: array[i * 2 + 1], left: null, right: null };
      nodes.push(currentNode.right);
    } else {
      nodes.push(null);
    }
  }

  return nodes;
};

console.log({ output: buildTree([5,3,6,2,4,null,8,1,null,null,null,7,9], console.log) });
