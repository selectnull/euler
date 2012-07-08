var primes = require('./primes'),
    _ = require('underscore')._;

module.exports.solve = function () {
    return _.max(primes.factors(600851475143));
};

