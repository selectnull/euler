var sanity = 'sanity check',
    utils = require('../utils');

describe('Sanity:', function () {
    it('should be "sanity check"', function () {
       sanity.should.equal(sanity); 
    });
});

describe('Testing utils', function () {
    it('sum of array', function () {
        utils._sum([]).should.equal(0);
        utils._sum([1, 2, 3]).should.equal(6);
    });

    it('divisibleBy', function () {
        divisibleBy(6, 2).should.equal(true);
        divisibleBy(6, 3).should.equal(true);
        divisibleBy(6, 4).should.equal(false);
    });
});

