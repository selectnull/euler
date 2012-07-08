var primes = require('../primes');

describe('Primes', function () {
    it('prime factors', function () {
        primes.factors(6).should.eql([2, 3]);
        primes.factors(13195).should.eql([5, 7, 13, 29]);
    });
});

