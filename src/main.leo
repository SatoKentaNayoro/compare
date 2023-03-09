// The 'compare' program.
program compare3.aleo {

    mapping account: address => u64;

    transition compare(public a: u64, public b: u64, public c: u64, public d: u64, public answer: u64, public owner: address) -> bool {
        let total: u64 = a + b + c + d;
        let ok: bool = (a + b + c + d).div(4u64).gt(answer);
        if ok {
            return ok then finalize(owner, 1u64);
        }else  {
            return ok then finalize(owner, 0u64);
        }
    }

    finalize compare(public owner: address, public amount: u64) {
        increment(account, owner, amount);
    }
}
