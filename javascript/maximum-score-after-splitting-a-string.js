/**
 * @param {string} s
 * @return {number}
 */
var maxScore = function(s) {
    let rightOnes = 0;
    for (let i = 1; i < s.length; i++) {
        if (s[i] == "1") {
            rightOnes++;
        }
    }
    let maxScore = 0;
    let leftZeroes = s[0] == "0" ? 1 : 0;
    for (let i = 1; i < s.length; i++) {
        maxScore = Math.max(maxScore, leftZeroes + rightOnes);
        if (s[i] == "0") {
            leftZeroes++;
        } else {
            rightOnes--;
        }
    }
    return maxScore;
};
