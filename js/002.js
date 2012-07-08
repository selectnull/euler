var _ = require('underscore')._,
    _sum = require('./utils')._sum,
    Fibonacci = require('./fibonacci').Fibonacci,

    solve = function () {
        var f = new Fibonacci(1, 2);
        while (f.next() < 4000000)
            f.next();
        return _sum(_.filter(f.sequence, function (el) { return el % 2 === 0; }));
    };

module.exports.solve = solve;

