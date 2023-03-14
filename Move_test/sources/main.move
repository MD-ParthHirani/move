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
    struct Coin <phantom CoinType>has store {
        value: u64,
    }
    struct GlobalStorage {
        resources: Map<address, Map<ResourceType, ResourceValue>>
        modules: Map<address, Map<ModuleName, ModuleBytecode>>
    }
    struct Balance<phantom CoinType> has key {
    coin: Coin<CoinType> // same Coin from Step 1
}
    fun withdraw<CoinType>(addr: address, amount: u64) : Coin<CoinType> acquires Balance {
        let balance = balance_of<CoinType>(addr);
        assert!(balance >= amount, EINSUFFICIENT_BALANCE);
        let balance_ref = &mut borrow_global_mut<Balance<CoinType>>(addr).coin.value;
        *balance_ref = balance - amount;
        Coin<CoinType> { value: amount }
}

    public fun mint(account: signer, value: u64) {
        move_to(&account, Coin { value })
    }

    
    public fun publish_balance(account: &signer) { ... }

   
    public fun mint(module_owner: &signer, mint_addr: address, amount: u64) acquires Balance { ... }

   
    public fun balance_of(owner: address): u64 acquires Balance { ... }

    public fun transfer(from: &signer, to: address, amount: u64) acquires Balance { ... }


     #[test(account = @0xC0FFEE)]
    fun test_mint_10(account: signer) acquires Coin {
        let addr = 0x1::signer::address_of(&account);
        mint(account, 10);
        assert!(borrow_global<Coin>(addr).value == 10, 0);
    }


}



