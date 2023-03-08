// The 'compare' program.
program compare1.aleo {

    mapping account: address => u64;

    record Token {
        owner: address,
        gates: u64,
        amount: u64,
    }

    transition issue(owner: address, amount: u64) -> Token {
        assert_eq(self.caller, aleo1zvmfvwjg6cx87d9whgkn04uysk2t9vup6mec2rmt3yk0njw70yxsuqdlaz);
        return Token {
            owner: owner,
            gates: 0u64,
            amount: amount,
        } then finalize(owner, amount);
    }

    finalize issue(receiver: address, amount: u64) {
        increment(account, receiver, amount);
    }


    function compare_inputs(a: u64, b: u64, c: u64, d: u64) -> bool {
        let answer: u64 = 123u64;
        let total: u64 = a + b + c + d;
        return (a + b + c + d).div(4u64).gt(answer);
    }

    transition compare(a: u64, b: u64, c: u64, d: u64, public receiver: address) -> bool {
        if (compare_inputs(a,b,c,d)) {
            return true then finalize(aleo1zvmfvwjg6cx87d9whgkn04uysk2t9vup6mec2rmt3yk0njw70yxsuqdlaz, receiver, 1u64);
        }else {
            return false then finalize(aleo1zvmfvwjg6cx87d9whgkn04uysk2t9vup6mec2rmt3yk0njw70yxsuqdlaz, receiver, 0u64);
        }
    }

    finalize compare(sender: address, public receiver: address, amount: u64) {
        decrement(account, sender, amount);
        increment(account, receiver, amount);
    }

}
