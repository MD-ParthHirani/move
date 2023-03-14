module MyCounterAddr::MyCounter {
     use StarcoinFramework::Signer;

     struct Counter has key, store {
        value:u64,
     }
     public fun init(account: &signer){
        move_to(account, Counter{value:0});
     }
     public fun incr(account: &signer) acquires Counter {
        let counter = borrow_global_mut<Counter>(Signer::address_of(account));
        counter.value = counter.value + 1;
     }

     public(script) fun init_counter(account: signer){
        Self::init(&account)
     }

     public(script) fun incr_counter(account: signer)  acquires Counter {
        Self::incr(&account)
     }
}
/*
module publisher::counter {
     use std::signer;

     struct CountHolder has key {
        count:u64,
     }
     public fun get_count(addr:address):u64 acquires CountHolder{
         assert!(exists<CountHolder>(addr),0);
         *&borrow_global<CountHolder>(addr).count
     }
     public entry fun bump(&account);
     acquires CountHolder
     {
      let addr = signer::address_of(&address);
      if (!exists<CountHolder>(addr)){
         move_to(&account, CountHolder{
            count: 0
         })
      }
      else{
         let old_count = borrow_global_mut<CountHolder>(addr);
         old_count.count = old_count + 1;
      }
     }
}*/