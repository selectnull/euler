#!/usr/bin/env node

var _ = require('underscore')._,
    path = require('path'),
    fs = require('fs');

var solve = function (module, fn) {
        return require('./' + module)[fn]();
    },

    padZeroes = function (number, length) {
        // pads a number with leading zeroes up to length of length
        return (number + "").length >= length ? number + "" : padZeroes("0" + number, length);
    },

    parseArguments = function (args) {
        var result = { problems: [] },
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
            }
        }
        
        return result;
    },

    checkSolution = function (problem) {
        var i,
            solutions = JSON.parse(fs.readFileSync(path.join(path.dirname(__dirname), 'problems.json')), 'utf-8');
        problem = parseInt(problem, 10);
        return _.find(solutions, function (p) { return p.problem === problem; }).solution;
    },

    args = parseArguments(process.argv);

var i, problem,
    solutionTemplate = _.template(
        "Solution to problem <%= problem %>: <%= solution %>" +
        "<% if (solution === checkedSolution) print(' (ok)'); " + 
        "else print(' (should be <%= checkedSolution %>)') %>"
    ),
    context;

for (i = 0; i < args.problems.length; i++ ) {
    problem = args.problems[i];
    context = {
        "problem": problem.module,
        "using": problem.fn,
        "solution": solve(problem.module, problem.fn),
        "checkedSolution": checkSolution(problem.module)
    }

    console.log(solutionTemplate(context));
}

