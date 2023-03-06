// The 'compare' program.
program compare.aleo {
    transition main(a: u32, b: u32, c: u32, d: u32, dst: u32) -> bool {
        let total: u32 = a + b + c + d;
        return (a + b + c + d).div(4u32).gt(dst);
    }
}
