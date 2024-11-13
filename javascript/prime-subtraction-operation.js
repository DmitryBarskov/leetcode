const PRIMES = [...generatePrimes(1000)];

function* generatePrimes(limit) {
    if (limit >= 2) { yield 2; }

    for (let i = 3; i < limit; i += 2) {
        if (isPrime(i)) {
            yield i;
        }
    }
}

function isPrime(number) {
    if (number === 2) { return true; }
    if (number % 2 == 0) { return false; }

    for (let divisor = 3; divisor <= Math.sqrt(number); divisor += 2) {
        if (number % divisor == 0) {
            return false;
        }
    }
    return true;
}

/**
 * @param {number[]} nums
 * @return {boolean}
 */
function primeSubOperation(nums) {
    let prevNumber = 0;
    for (const num of nums) {
        if (num <= prevNumber) {
            return false;
        }
        let primes = PRIMES.filter((p) => prevNumber < num - p && p < num);
        if (primes.length == 0) {
            prevNumber = num;
        } else {
            prevNumber = num - primes[primes.length - 1];
        }
    }
    return true;
}
