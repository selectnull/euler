use std::env;

mod p001;
mod p003;
mod p006;

mod primes;

fn about() {
    println!("projecteuler.net problems implemented in Rust");
    println!("Usage: euler N1 [N2, ...]");
    println!("where Nx is problem to run");
}

fn solve_problem(n: i32) {
    fn output(problem: i32, result: String) {
        println!("Problem {}: {}", problem, result)
    }

    match n {
        1 => output(n, p001::solve()),
        3 => output(n, p003::solve()),
        6 => output(n, p006::solve()),
        _ => println!("Nope, you haven't solved problem {} yet.", n)
    }
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if let Some((_, problems)) = args.split_first() {
        if problems.len() == 0 {
            about();
        }

        for problem in problems {
            match problem.parse::<i32>() {
                Ok(n) => solve_problem(n),
                Err(_) => println!("{} is not a number.", problem)
            }
        }
    }
}
