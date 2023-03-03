module 0x42::SocialNetwork{
    
    use std::vector;

    struct Friends has store,key, drop{
        people:vector<Person>
    }

    struct Person has store,key, drop,copy{
        age:u8,
        name:vector<u8>,  
    }

    public fun create_friend(myFriend: Person,friends: &mut Friends):Person{

        let newFriend = Person{
            name:myFriend.name,
            age:myFriend.age,
        };
        add_friend(newFriend,friends);
        return newFriend

    }

    public fun add_friend(_person: Person ,friends: &mut Friends){
        vector::push_back(&mut friends.people, _person)

    }
    #[test]
    fun test_create_friend()
    {
        let parth = Person{
            name:b"Parth",
            age:22,
        };
        let friends = Friends{
            people:(vector[parth])
        };
        let createFriend = create_friend(parth,&mut friends);
        assert!(createFriend.name == b"Parth", 0); 
    }
}