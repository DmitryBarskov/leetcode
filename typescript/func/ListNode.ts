class ListNode {
  val: number;
  next: ListNode | null;
  constructor(val?: number, next?: ListNode | null) {
    this.val = val === undefined ? 0 : val;
    this.next = next === undefined ? null : next;
  }
}

const arrayFromListNode = (node: ListNode | null): Array<number> => {
  if (node === null) return [];

  return [node.val, ...arrayFromListNode(node.next)];
};

const listNodeFromArray = (array: Array<number>): ListNode | null => {
  if (array.length === 0) return null;

  const [head, ...tail] = array;
  return new ListNode(head, listNodeFromArray(tail));
};

export default ListNode;
export { arrayFromListNode, listNodeFromArray };
