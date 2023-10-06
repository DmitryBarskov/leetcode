const tail = <T>(arr: Array<T>): Array<T> => {
  let [_head, ...rest] = arr;
  return rest;
};

export default tail;
