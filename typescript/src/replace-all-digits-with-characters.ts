function replaceDigits(s: string): string {
  let result: Array<String> = new Array(s.length);

  for (let i = 1; i < s.length; i += 2) {
    const symbol = s[i - 1];
    const shift = parseInt(s[i]);
    result[i - 1] = symbol;
    result[i] = String.fromCharCode(symbol.charCodeAt(0) + shift);
  }
  if (result.length % 2 !== 0) {
    result[result.length - 1] = s[s.length - 1];
  }

  return result.join("");
};
