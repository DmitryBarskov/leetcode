function minDeletions(s: string): number {
  let countToSymbols = reverseMap(countSymbols(s));


  let deletions = 0;
  for (let [count, symbols] of countToSymbols) {
    if (symbols.length <= 1) { continue; }
    if (count == 0) { continue; }

    while (symbols.length > 1) {
      let symbol = symbols.pop()!!;
      let slot = findFreeSlot(countToSymbols, count);
      deletions += count - slot;

      if (!countToSymbols.has(slot)) {
        countToSymbols.set(slot, []);
      }
      countToSymbols.get(slot)!!.push(symbol);
    }
  }

  return deletions;
}

function findFreeSlot(counts: Map<number, string[]>, fromCount: number): number {
  for (let i = fromCount - 1; i > 0; i--) {
    if (!counts.has(i) || counts.get(i)?.length == 0) {
      return i;
    }
  }
  return 0;
}

function countSymbols(s: string): Map<string, number> {
  const occurrences = new Map<string, number>();
  for (let i = 0; i < s.length; i++) {
    occurrences.set(s[i], (occurrences.get(s[i]) ?? 0) + 1);
  }
  return occurrences;
}

function reverseMap<K, V>(map: Map<K, V>): Map<V, K[]> {
  const reversed = new Map<V, K[]>();
  map.forEach((v, k) => {
    if (!reversed.has(v)) {
      reversed.set(v, []);
    }
    reversed.get(v)!!.push(k);
  });
  return reversed;
}


console.log(minDeletions("bbcebab"));
