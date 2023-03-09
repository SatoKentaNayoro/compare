// The 'compare' program.
program compare7.aleo {
    transition compare(a: u64, b: u64, c: u64, d: u64) -> public bool {
        let total: u64 = a + b + c + d;
        let answer: u64 = 100u64;
        return (a + b + c + d).div(4u64).gt(answer);
    }
}
