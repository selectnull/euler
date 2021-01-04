pub fn solve() -> String {
    let sum_of_squares = (1..101).map(|n| n*n).sum::<i32>();
    let square_of_sums = (1..101).sum::<i32>().pow(2);

    (square_of_sums - sum_of_squares).to_string()
}
