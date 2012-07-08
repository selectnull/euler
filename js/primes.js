var utils = require('./utils'),
    factorization = require('./factorization'),
    isPrime = function (n) {
        // returns true if n is prime, otherwise returns false
        var i,
            upperBound = Math.ceil(Math.sqrt(n));

        for (i = 2; i < upperBound; i++)
            if (n % i === 0)
                return false;
        return true;
    },

    factors = function (n) {
        // returns an array of prime factors of n
        var i,
            upperBound = n / 2 + 1,
            result = [];

        for (i = 2; i < upperBound; i++)
            if (utils.divisibleBy(n, i) && isPrime(i))
                result.push(i);
        return result;
    };

module.exports.isPrime = isPrime;
module.exports.factors = factors;

