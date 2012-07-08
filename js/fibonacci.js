var Fibonacci = function (first, second) {
    return {
        first: first,
        second: second,
        nextToLast: first,
        last: second,

        sequence: [first, second],

        next: function () {
            var x = this.nextToLast + this.last;
            this.nextToLast = this.last;
            this.last = x;
            this.sequence.push(this.last);
            return x;
        }
    }
};

module.exports.Fibonacci = Fibonacci;

