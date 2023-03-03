/*module 0xCAFE::BasicCoin {
     
    #[test_only]
    use std::signer;

    struct Coin has key {
        value: u64,
    }

    public fun mint(account: signer, value: u64) {
        move_to(&account, Coin { value })
    }

  
    #[test(account = @0xC0FFEE)]
    fun test_mint_10(account: signer) acquires Coin {
        let addr = signer::address_of(&account);
        mint(account, 10);
        assert!(borrow_global<Coin>(addr).value == 10, 0);
    }
}*/

module NamedAddr::BasicCoin{
    use std::signer;

    const MODULE_OWNER:address = @NamedAddr;
    
    const ENOT_MODULE_OWNER: u64=0;
    const EINSUFFICIENT_BALANCE:u64 = 1;
    const EALREADY_HAS_BALANCE: u64 = 2;

    struct Coin has store{
        value: u64
    }
    struct Balance has key{
        coin:Coin
    }

    public fun publish_balance(account:&signer){
        let empty_coin  =Coin{
            value:0
        };
        move_to(account,Balance{coin:empty_coin})

    }
    public fun mint (module_owner:&signer,mint_addr:address,amount:u64){
        assert!(signer::address_of(module_owner)== MODULE_OWNER,ENOT_MODULE_OWNER);
        deposit(mint_addr,Coin{value:amount});
    }
    public fun balance_of(owner:address):u64 acquires Balance{
        borrow_global<Balance>(owner).coin.value
    }

    public fun transfer(from:&signer,to:address,amount:u64) acquires Balance{

        let check = withdrow(signer::address_of(from),amount);
        deposit(to,check);

    }

    fun withdrow(addr:address,amount:u64):Coin acquires Balance{
        let balance = balance_of(addr);
        assert!(balance >= amount,EINSUFFICIENT_BALANCE);
        let balance_ref = &mut borrow_global_mut<Balance>(addr).coin.value;
        *balance_ref = balance - amount;
        Coin{
            value:amount
        }
    }

    fun deposit(_addr:address,check:Coin){
        let Coin { value:_amount} = check;
    }
}
