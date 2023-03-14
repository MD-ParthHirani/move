module 0x42::Company{
    use std::vector;
    const CONTRACT:address = @0x42;

    struct Employees has store,key, drop{
        people:vector<Employee>
    }

    struct Employee has store,key, drop,copy{
        age:u8,
        name:vector<u8>,
        income:u64,

    }

    public fun create_employee(_employee: Employee,_employees: &mut Employees):Employee{

        let newEmployee = Employee{
            name:_employee.name,
            age:_employee.age,
            income:_employee.income,
        };
        add_employee(_employees ,newEmployee);
        return newEmployee
    }
    fun add_employee(_employees: &mut Employees, _employee: Employee){
        vector::push_back(&mut _employees.people, _employee)
        }
    
    public fun increase_income(employee:&mut Employee, bouns:u64 ):&mut Employee{
        employee.income = employee.income + bouns;
        return employee
    }

    public fun decrease_income(employee:&mut Employee, penalty:u64 ):&mut Employee{
        employee.income = employee.income - penalty;
        return employee
    }

    public fun multiply_income(employee:&mut Employee, factor:u64 ):&mut Employee{
        employee.income = employee.income * factor;
        return employee
    }

    public fun divide_income(employee:&mut Employee, divisor:u64 ):&mut Employee{
        employee.income = employee.income / divisor;
        return employee
    }

    public fun is_employee_age_event(employee: &Employee):bool{
        let isEvent: bool;
        if (employee.age%2 ==0){
            isEvent=true;
        }else{
            isEvent = false;
        };
        return isEvent
    }

    #[test]
    fun test_create_employee()
    {
        let parth = Employee{
            name:b"Parth",
            age:22,
            income:100,
        };
        let employees = Employees{
            people:(vector[parth]),
        };
        let createEmployee = create_employee(parth,&mut employees);
        assert!(createEmployee.name == parth.name, 0);
    }

    #[test]
    fun test_increase_employee()
    {
        let parth = Employee{
            name:b"Parth",
            age:22,
            income:100,
        };
        let employees = Employees{
            people:(vector[parth]),
        };
        let createEmployee = create_employee(parth,&mut employees);
        let increaseEmployeeIncome = increase_income(&mut  createEmployee ,100);
        assert!(increaseEmployeeIncome.income == 200, 0)
    }

    #[test]
    fun test_decrease_income()
    {
        let parth = Employee{
            name:b"Parth",
            age:22,
            income:100,
        };
        let employees = Employees{
            people:(vector[parth]),
        };
        let createEmployee = create_employee(parth,&mut employees);
        let decreaseEmployeeIncome = decrease_income(&mut  createEmployee ,50);
        assert!(decreaseEmployeeIncome.income == 50, 0);
    }

     #[test]
    fun test_multiply_income()
    {
        let parth = Employee{
            name:b"Parth",
            age:22,
            income:100,
        };
        let employees = Employees{
            people:(vector[parth]), 
        };
        let createEmployee = create_employee(parth,&mut employees);
        let multiplyedEmployeeIncome = multiply_income(&mut  createEmployee ,2);
        assert!(multiplyedEmployeeIncome.income == 200, 0);
    }
    #[test]
    fun test_divide_income()
    {
        let parth = Employee{
            name:b"Parth",
            age:22,
            income:100,
        };
        let employees = Employees{
            people:(vector[parth]),
        };
        let createEmployee = create_employee(parth,&mut employees);
        let diviedEmployeeIncome = divide_income(&mut  createEmployee ,2);
        assert!(diviedEmployeeIncome.income == 50, 0);
    }
    #[test]
    fun test_is_Employee_age_event()
    {
        let parth = Employee{
            name:b"Parth",
            age:21,
            income:100,
        };
        let employees = Employees{
            people:(vector[parth]),
        };
        let createEmployee = create_employee(parth,&mut employees);
        let isEvent = is_employee_age_event(&createEmployee);
        assert!(isEvent == false, 0);
    }

}
