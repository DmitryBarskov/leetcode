type Count = { [k: string]: number };

const countChars = (str: string): Count => {
  const count = {};
  for (let i = 0; i < str.length; i++) {
    count[str[i]] = (count[str[i]] ?? 0) + 1;
  }
  return count;
};

const decreaseKey = (count: Count, char: string) => {
  count[char] ??= 0;
  count[char] -= 1;
};

const increaseKey = (count: Count, char: string) => {
  count[char] ??= 0;
  count[char] += 1;
};

const has = (superset: Count, subset: Count): boolean => {
  for (const key in subset) {
    if (subset[key] > (superset[key] ?? 0)) {
      return false;
    }
  }
  return true;
};

function minWindow(s: string, t: string): string {
  let minimalWindow: [number, number] | null = null;
  const requiredSymbols = countChars(t);
  const symbolsCount = {};
  let from = 0;
  let to = 0;
  while (to < s.length) {
    increaseKey(symbolsCount, s[to]);
    to++;
    while (has(symbolsCount, requiredSymbols)) {
      if (minimalWindow == null || to - from < minimalWindow[1] - minimalWindow[0]) {
        minimalWindow = [from, to];
      }
      decreaseKey(symbolsCount, s[from]);
      from++;
    }
  }
  if (minimalWindow == null) { return ""; }
  return s.substring(...minimalWindow);
}

console.log(minWindow("ADOBECODEBANC", "ABC"))