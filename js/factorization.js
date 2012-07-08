var utils = require('./utils'),

    factors = function (n) {
        var i,
            upperBound = n / 2 + 1,
            result = [];

        for (i = 2; i < upperBound; i++)
            if (utils.divisibleBy(n, i))
                result.push(i);
        return result;
    };

module.exports.factors = factors;

