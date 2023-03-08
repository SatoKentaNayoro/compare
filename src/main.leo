// The 'compare' program.
program compare3.aleo {
    function compare_inputs(a: u64, b: u64, c: u64, d: u64) -> bool {
        let answer: u64 = 123u64;
        let total: u64 = a + b + c + d;
        return (a + b + c + d).div(4u64).gt(answer);
    }

    transition compare(public a: u64, public b: u64, public c: u64, public d: u64, public receiver: address) -> (public bool, address) {
        return (compare_inputs(a,b,c,d), receiver);
    }
}
