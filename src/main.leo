// The 'compare' program.
program compare5.aleo {

    mapping account: address => u64;

    transition compare(a: u64, b: u64, c: u64, d: u64, answer: u64, owner: address) -> bool {
        let total: u64 = a + b + c + d;
        let ok: bool = (a + b + c + d).div(4u64).gt(answer);
        if ok {
            return ok then finalize(owner, 1u64);
        }else  {
            return ok then finalize(owner, 0u64);
        }
    }

    finalize compare(owner: address, amount: u64) {
        increment(account, owner, amount);
    }
}
