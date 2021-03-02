use rand::Rng;
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let n: u32 = args[1].parse().unwrap();
    for _ in 0..n {
	let x: f64 = rand::thread_rng().gen(); 
	println!("{:.6}", x);
    }
}
