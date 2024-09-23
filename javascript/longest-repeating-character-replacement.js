class CharCount {
    constructor() {
        this.count = {};
        this.total = 0;
        this.top = null;
        this.topCount = 0;
    }

    increment(char) {
        this.count[char] = (this.count[char] ?? 0) + 1;
        this.top ??= char;
        if (this.count[char] > this.topCount) {
            this.top = char;
            this.topCount = this.count[char];
        }
        this.total++;
    }

    decrement(char) {
        this.count[char]--;
        this.total--;
        if (char == this.top) {
            this.topCount--;
            Object.entries(this.count).forEach(([k, v]) => {
                if (v > this.topCount) {
                    this.topCount = v;
                    this.top = k;
                }
            });
        }
    }

    sizeExceptTop() {
        return this.total - this.topCount;
    }
}

/**
 * @param {string} s
 * @param {number} k
 * @return {number}
 */
function characterReplacement(s, k) {
    let l = 0;
    let charsCount = new CharCount();
    let topChar = null;
    let longest = 0;
    for (let r = 0; r < s.length; r++) {
        charsCount.increment(s[r]);
        while (charsCount.sizeExceptTop() > k) {
            charsCount.decrement(s[l]);
            l++;
        }
        if (charsCount.total > longest) {
            longest = charsCount.total;
        }
    }
    return longest;
}
