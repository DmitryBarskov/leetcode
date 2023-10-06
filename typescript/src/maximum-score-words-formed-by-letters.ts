type Scoring = {
  [k: string]: Array<number>
}

function clone(scoring: Scoring): Scoring {
  let result: Scoring = {};
  for (const prop in scoring) {
    result[prop] = scoring[prop].slice();
  }
  return result;
}

const scoreWord = (scoring: Scoring) => (word: string): number => {
  let scoreRemaining: Scoring = clone(scoring);
  let result = 0;
  for (let i = 0; i < word.length; i++) {
    let char = word[i];
    if (scoreRemaining[char] === undefined || scoreRemaining[char].length === 0) {
      return 0;
    }
    result += scoreRemaining[char].pop()!!;
  }
  return result;
}

function buildScoring(letters: string[], scores: number[]): Scoring {
  let result: Scoring = {};

  letters.forEach(letter => {
    result[letter] ||= [];
    let score = scores[letter.charCodeAt(0) - "a".charCodeAt(0)];
    result[letter].push(score);
  });

  return result;
}

const log = <T>(item: T): T => {
  console.log(item);
  return item;
}

const getAllSubsets = <T>(theArray: Array<T>): Array<Array<T>> => theArray.reduce(
  (subsets: Array<Array<T>>, value: T) => subsets.concat(
    subsets.map(set => [value, ...set])
  ),
  [[]]
);


function maxScoreWords(words: string[], letters: string[], score: number[]): number {
  let scoring: Scoring = buildScoring(letters, score);

  return getAllSubsets(words).map(subsets => scoreWord(scoring)(subsets.join(""))).reduce((a, b) => a > b ? a : b, 0);
}
