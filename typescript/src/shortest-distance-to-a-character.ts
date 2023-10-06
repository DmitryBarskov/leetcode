function shortestToChar(s: string, c: string): number[] {
  const result = new Array<number>(s.length);

  let indeces: number[] = [];

  for (let i = 0; i < s.length; i++) {
    const char = s[i];
    if (char === c) {
      indeces.push(i);
    }
  }

  for (let i = 0; i <= indeces[0]; i++) {
    result[i] = indeces[0] - i;
  }

  for (let i = indeces.at(-1)!!; i < result.length; i++) {
    result[i] = i - indeces.at(-1)!!;
  }

  for (let i = 1; i < indeces.length; i++) {
    let leftZeroIndex = indeces[i - 1];
    let rightZeroIndex = indeces[i];
    let bound = Math.floor((leftZeroIndex + rightZeroIndex) / 2);

    for (let j = leftZeroIndex; j <= bound; j++) {
      result[j] = j - leftZeroIndex;
    }

    for (let j = bound + 1; j < rightZeroIndex; j++) {
      result[j] = rightZeroIndex - j;
    }
  }

  return result;
}
