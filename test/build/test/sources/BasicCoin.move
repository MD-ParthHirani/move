// address 0x42 {
// module example {
//     struct S has copy, drop { f: u64, s: vector<u8> }

//     fun always_true(): bool {
//         let s = S { f: 0, s: b"" };
//         // parens are not needed but added for clarity in this example
//         (copy s) == s
//     }

//     fun always_false(): bool {
//         let s = S { f: 0, s: b"" };
//         // parens are not needed but added for clarity in this example
//         (copy s) != s
//     }
// }
// }


module 0xCAFE::BasicCoin {
    struct Coin has key {
        value: u64,
    }

    public fun mint(account: signer, value: u64) {
        move_to(&account, Coin { value })
    }

     #[test(account = @0xC0FFEE)]
    fun test_mint_10(account: signer) acquires Coin {
        let addr = 0x1::signer::address_of(&account);
        mint(account, 10);
        assert!(borrow_global<Coin>(addr).value == 10, 0);
    }
}



