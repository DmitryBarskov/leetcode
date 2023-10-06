const countRepeatingClusters = (str: string): number[] => {
  let maxCounts: number[] = [];
  let count = 1;
  for (let i = 1; i < str.length; i++) {
    if (str[i] === str[i - 1]) {
      count++;
    } else {
      if (count >= 3) {
        maxCounts.push(count);
      }
      count = 1;
    }
  }
  if (count >= 3) {
    maxCounts.push(count);
  }
  return maxCounts;
};


export function strongPasswordChecker(password: string): number {
  const sum = (a: number, b: number) => a + b;

  const hasDigit = /\d/.test(password);
  const hasLowercase = /[a-z]/.test(password);
  const hasUppercase = /[A-Z]/.test(password);
  let repeatingClusters = countRepeatingClusters(password);
  let extraChars = password.length > 20 ? password.length - 20 : 0;
  const missingChars = password.length < 6 ? 6 - password.length : 0;

  let changeCount = 0;
  let deletions = 0;

  if (!hasDigit) {
    changeCount++;
  }
  if (!hasLowercase) {
    changeCount++;
  }
  if (!hasUppercase) {
    changeCount++;
  }
  if (extraChars > 0 && repeatingClusters.length > 0) {
    console.log('before', { extraChars, repeatingClusters, changeCount });
    // "bbaaaaaaaaaaaaaaccccc"
    for (let repeat = 0; repeat < 10; repeat++) {
      outerLoop:
      for (let remainder = 0; remainder < 3 && extraChars > remainder; remainder++) {
        for (let i = 0; i < repeatingClusters.length && extraChars > remainder; i++) {
          if (repeatingClusters[i] % 3 === remainder) {
            repeatingClusters[i] -= remainder + 1;
            extraChars -= remainder + 1;
            deletions += remainder + 1;
            break outerLoop;
          }
        }
      }
      repeatingClusters = repeatingClusters.filter(x => x > 2);
    }

    console.log('after', { extraChars, repeatingClusters, changeCount });
  }
  if (repeatingClusters.length > 0) {
    let repeatitionEliminationChanges = repeatingClusters
                                          .map(clusterSize => Math.floor(clusterSize / 3))
                                          .reduce(sum, 0);
    changeCount = Math.max(repeatitionEliminationChanges, changeCount);
    console.log({ repeatitionEliminationChanges });
  }
  if (extraChars > 0) {
    deletions += extraChars;
  }
  if (missingChars > 0) {
    changeCount = Math.max(missingChars, changeCount);
  }
  return changeCount + deletions;
}


console.log({
  result: strongPasswordChecker("FFFFFFFFFFFFFFF11111111111111111111AAA")
});
