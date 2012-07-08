#!/usr/bin/env node

var _ = require('underscore')._;

var solve = function (module, fn) {
        return require('./' + module)[fn]();
    },

    padZeroes = function (number, length) {
        // pads a number with leading zeroes up to length of length
        return (number + "").length >= length ? number + "" : padZeroes("0" + number, length);
    },

    parseArguments = function (args) {
        var result = {
                problems: [],
                checkSolution: true
            },
            i, arg,
            rx = /^(\d{1,3})(\.js)?(\:[\w]+)?$/,
            match, fn;

        for (i = 2; i < args.length; i++) {
            arg = args[i];

            match = rx.exec(arg);
            if (match) {
                // if arg can be parsed as int (max 3 digits), add it to problems to solve
                // also, if it has .js in the end, it's the same thing
                // everything after optional colon : is function name to invoke (defaults to solve)
                fn = 'solve';
                if (match[3]) {
                    fn = match[3].substring(1);
                }
                result.problems.push({ module: padZeroes(match[1], 3), fn: fn });
            } else if (arg === '--nocheck') {
                result.checkSolution = false;
            }
        }
        
        return result;
    },
    args = parseArguments(process.argv);

var i, problem,
    solutionTemplate = _.template("Solution to problem <%= problem %>: <%= solution %>"),
    context;

for (i = 0; i < args.problems.length; i++ ) {
    problem = args.problems[i];
    context = {
        "problem": problem.module,
        "using": problem.fn,
        "solution": solve(problem.module, problem.fn)
    }

    console.log(solutionTemplate(context));
}

