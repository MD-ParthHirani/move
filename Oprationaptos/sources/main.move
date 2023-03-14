module data::opration {
 
   use std::debug;


    #[view]
    public fun get_add(a:u64,b:u64):u64 {
        let sumof=a+b;
        sumof
    }
    
     #[test(account = @0x1)]
    public entry fun set_add() 
     {
        let r = get_add(10,10);
       print(&r);
    }

    #[view]
    public fun get_sub(a:u64,b:u64):u64 {
        let sumof=a-b;
        sumof
    }

     #[test(account = @0x1)]
    public entry fun set_sub() 
     {
        let r = get_sub(10,5);
       print(&r);
    }

    #[view]
    public fun get_mul(a:u64,b:u64):u64 {
        let sumof=a*b;
        sumof
    }

     #[test(account = @0x1)]
    public entry fun set_mul() 
     {
        let r = get_mul(10,10);
       print(&r);
    }

    #[view]
    public fun get_div(a:u64,b:u64):u64 {
        let sumof=a/b;
        sumof
    }

     #[test(account = @0x1)]
    public entry fun set_div() 
     {
        let r = get_div(10,10);
       print(&r);
    }
}
    












    // module data::opration {
    // use std::error;
    // use std::signer;
    
    // struct Addtion has store,key, drop,copy {
    //     number:u64
    // }

    //  struct Subtraction has store,key, drop,copy {
    //     number:u64
    // }

    //  struct Multiplication has store,key, drop,copy {
    //     number:u64
    // }

    //  struct Divition has store,key, drop,copy {
    //     number:u64
    // }
    // const ENO_MESSAGE: u64 = 0;

    // #[view]
    // public fun get_add(addr: address): u64 acquires Addtion {
    //     assert!(exists<Addtion>(addr), error::not_found(ENO_MESSAGE));
    //     *&borrow_global<Addtion>(addr).number
    // }

    // public entry fun set_add_num(account: signer, a:u64, b:u64)
    // {
    //     let account_addr = signer::address_of(&account);
    //     let sum_of=a+b;
    //     if (!exists<Addtion>(account_addr)) {
    //         move_to(&account, Addtion{number:sum_of})
    //     }
    // }
    
    

    // #[test(account = @0x1)]
    // public entry fun set_add(account: signer) acquires Addtion
    //  {
    //     let addr = signer::address_of(&account);
    //     set_add_num(account,6,10);

    //     assert!(
    //       get_add(addr) == 16,
    //       ENO_MESSAGE
    //     );
    
    // }


    //  #[view]
    // public fun get_sub(addr: address): u64 acquires Subtraction {
    //     assert!(exists<Subtraction>(addr), error::not_found(ENO_MESSAGE));
    //     *&borrow_global<Subtraction>(addr).number
    // }

    // public entry fun set_sub_num(account: signer, a:u64, b:u64)
    // {
    //     let account_addr = signer::address_of(&account);
    //     let sum_of=a-b;
    //     if (!exists<Subtraction>(account_addr)) {
    //         move_to(&account, Subtraction{number:sum_of})
    //     }
    // }
    
    

    // #[test(account = @0x1)]
    // public entry fun set_sub(account: signer) acquires Subtraction
    //  {
    //     let addr = signer::address_of(&account);
    //     set_sub_num(account,10,5);

    //     assert!(
    //       get_sub(addr) == 5,
    //       ENO_MESSAGE
    //     );
    
    // }

    // #[view]
    // public fun get_mul(addr: address): u64 acquires Multiplication{
    //     assert!(exists<Multiplication>(addr), error::not_found(ENO_MESSAGE));
    //     *&borrow_global<Multiplication>(addr).number
    // }

    // public entry fun set_mul_num(account: signer, a:u64, b:u64)
    // {
    //     let account_addr = signer::address_of(&account);
    //     let sum_of=a*b;
    //     if (!exists<Multiplication>(account_addr)) {
    //         move_to(&account, Multiplication{number:sum_of})
    //     }
    // }

    // #[test(account = @0x1)]
    // public entry fun set_mul(account: signer) acquires Multiplication
    //  {
    //     let addr = signer::address_of(&account);
    //     set_mul_num(account,10,5);

    //     assert!(
    //       get_mul(addr) == 50,
    //       ENO_MESSAGE
    //     );
    
    // }

    // #[view]
    // public fun get_div(addr: address): u64 acquires Divition{
    //     assert!(exists<Divition>(addr), error::not_found(ENO_MESSAGE));
    //     *&borrow_global<Divition>(addr).number
    // }

    // public entry fun set_div_num(account: signer, a:u64, b:u64)
    // {
    //     let account_addr = signer::address_of(&account);
    //     let sum_of=a/b;
    //     if (!exists<Divition>(account_addr)) {
    //         move_to(&account, Divition{number:sum_of})
    //     }
    // }

    // #[test(account = @0x1)]
    // public entry fun set_div(account: signer) acquires Divition
    //  {
    //     let addr = signer::address_of(&account);
    //     set_div_num(account,10,2);

    //     assert!(
    //       get_div(addr) == 5,
    //       ENO_MESSAGE
    //     );
    
    // }

    




/*module 0x42::Option{

    struct Calc has store,key, drop,copy{
       
        num1:u64,
    }
  
    public fun addtion(numbers:&mut Calc, num2:u64 ):&mut Calc{
        numbers.num1 = numbers.num1 + num2;
        return numbers
    }

    #[test]
    fun test_addtion()
    {
        let parth = Calc{
           
            num1:100,
        
        };
       
        let increaseaddtion = addtion(&mut parth,100);
        assert!(increaseaddtion.num1 == 200, 0)
        
    }

     public fun sub(numbers:&mut Calc, num2:u64 ):&mut Calc{
        numbers.num1 = numbers.num1 - num2;
        return numbers
    }

    #[test]
    fun test_sub()
    {
        let parth = Calc{
           
            num1:100,
        
        };
       
        let increaseaddtion = sub(&mut parth,50);
        assert!(increaseaddtion.num1 == 50, 0)
        
    }

    public fun mul(numbers:&mut Calc, num2:u64 ):&mut Calc{
        numbers.num1 = numbers.num1 * num2;
        return numbers
    }

    #[test]
    fun test_mul()
    {
        let parth = Calc{
           
            num1:50,
        
        };
       
        let increaseaddtion = mul(&mut parth,2);
        assert!(increaseaddtion.num1 == 100, 0)
        
    }
    public fun div(numbers:&mut Calc, num2:u64 ):&mut  Calc{
        numbers.num1 = numbers.num1 / num2;
        return numbers
    }

    #[test]
    fun test_div()
    {
        let parth = Calc{
           
            num1:100,
        
        };
       
        let increaseaddtion = div(&mut parth,2);
        assert!(increaseaddtion.num1 == 50, 0)
        
    }
}
}*/




