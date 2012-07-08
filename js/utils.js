var _ = require('underscore')._,
    sum = function (list) {
        return _.reduce(list, function(memo, num) {
            return memo + num;
        }, 0);
    };
    divisibleBy = function (num, by) {
        return num % by === 0;
    };

module.exports._sum = sum;
module.exports.divisibleBy = divisibleBy;

