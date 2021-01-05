pub fn factors(n: i64) -> Vec<i64> {
    let mut result = Vec::new();
    let max_factor = (n as f64).sqrt().trunc() as i64;
    let mut number = n;
    let mut divisor = 2i64;

    while divisor <= max_factor {
        if number % divisor == 0 {
            result.push(divisor);
            number = number / divisor;
        } else {
            divisor += 1;
        }
    }

    result
}
