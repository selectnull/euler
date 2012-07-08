var Fibonacci = require('../fibonacci').Fibonacci;

describe('Fibonacci tests', function () {
    F = Fibonacci(1, 1);
    it('first two elements', function () {
        F.first.should.equal(1);
        F.last.should.equal(1);
    });
    it('next 3 elements should be 2, 3 and 5', function () {
        F.next().should.equal(2);
        F.next().should.equal(3);
        F.next().should.equal(5);
    });
    it('sequence should be [1, 1, 2, 3, 5]', function () {
        F.sequence.should.eql([1, 1, 2, 3, 5]);
    });
});

