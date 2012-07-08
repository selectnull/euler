var factorization = require('../factorization');

describe('Factors', function () {
    it('factors', function () {
        factorization.factors(6).should.eql([2, 3]);
        factorization.factors(20).should.eql([2, 4, 5, 10]);
        factorization.factors(13195).should.eql([5, 7, 13, 29, 35, 65, 91, 145, 203, 377, 455, 1015, 1885, 2639]);
    });
});

