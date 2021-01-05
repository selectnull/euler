use primes;

pub fn solve() -> String {
    primes::factors(600851475143).last().unwrap().to_string()
}
