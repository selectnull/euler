pub fn solve() -> String {
    (1..1000).filter(|&n| n % 3 == 0 || n % 5 == 0).sum::<i32>().to_string()
}
