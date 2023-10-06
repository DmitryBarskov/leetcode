export const zip3 = <T, U, V>(arr1: T[], arr2: U[], arr3: V[]): Array<[T, U, V]> => {
  let arr = new Array<[T, U, V]>(Math.min(arr1.length, arr2.length, arr3.length));
  for (let i = 0; i < arr.length; i++) {
    arr[i] = [arr1[i], arr2[i], arr3[i]];
  }
  return arr;
};

const zip = <T, U>(arr1: Array<T>, arr2: Array<U>): Array<[T, U]> => {
  let arr = new Array<[T, U]>(Math.min(arr1.length, arr2.length));
  for (let i = 0; i < arr.length; i++) {
    arr[i] = [arr1[i], arr2[i]];
  }
  return arr;
};

export default zip;
