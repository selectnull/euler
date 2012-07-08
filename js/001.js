var _ = require('underscore')._;

var _sum = function (list) {
        return _.reduce(list, function(memo, num) {
            return memo + num;
        }, 0);
    };

var solvePlain = function () {
    // this is a solution using plain javascript accumulator sytle
    var i, result = 0;
    for (i=1; i < 1000; i++ ) {
        if (i % 3 === 0 || i % 5 === 0)
            result += i;
    }

    return result;
}

var solveUnderscore = function () {
    // this is a solution using underscore
    return _sum(_.filter(_.range(1000), function (i) { return i % 3 === 0 || i % 5 === 0;}));
}

module.exports = {
    solve: solveUnderscore,
    solvePlain: solvePlain,
    solveUnderscore: solveUnderscore
}

