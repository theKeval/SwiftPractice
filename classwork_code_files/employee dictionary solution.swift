/*
Suppose we have list of employees, we have the employee name and salary
let the user enter their data and fill it in a dictionary then do following:
1. Find and print the name of the employee who has the highest salary
2. Find and print the name and salary of the employee who gets the lowest salary
3. Enter an employee name and print out his/her salary and names of employees who are having a similar salary, but if the employee not found, print a messages says that, or if no employees have the same salary print a message says that
4. Let the user enter an employee name, if found then find and print out the amount of tax which is 15% of the salary for salaries less than 5000 and 20% for others.
5. Find and print the average of all salaries

at the beginning of the program show a menu to the user including all the 5 requirements
so the user can choose any of them or 0 to exit

The menu:
0. Exit
1. The employee of the highest salary
2. The employee name and salary of lowest salary
3. Employees of similar salary of given name
4. Tax for a given employee
5. Average of all salaries

Choose your option:

*/


import Foundation


//create the dictionary
var employee = [String:Double]()

//reading and filling the data
func fillData(){
    while (true){
        print("Enter the employee name:")
        let name = readLine()!
        print("Enter the employee salary:")
        let salary = Double(readLine()!)!
        employee[name] = salary
        print("Enter 0 to stop or any number to add more eployees:")
        if Int(readLine()!)! == 0{
            break
        }
    }
}

//finding the name of the mployee who gets the highest salary
func highestSalary() -> String {
    var max:Double? = 0.0 //maximum salary
    var maxName = "" //name of employee of maximum salary
    for emp in employee.keys{
        if employee[emp]! > max! {
            max = Double(employee[emp]!) //max will always has the highest salary
            maxName = emp //maxName will always has the name of the employee
        }
        
    }
    return maxName
}

//finding and printing the name and salary of employee with lowest salary

func lowestSalary() {
    var min = employee.values.first
    var minName = employee.keys.first
    for emp in employee.keys{
        if employee[emp]! < min! {
            min = Double(employee[emp]!) //max will always has the highest salary
            minName = emp //maxName will always has the name of the employee
        }
        
    }
    print("the name of the employee of lowest salary is \(minName!)")
    print("The lowest salary = \(min!)")
}
//function gets employee name and returns the salary or -1 if not found
func getSalary(name:String) ->Double{
    for emp in employee.keys{
        if emp == name{
            return employee[emp]!
        }
    }
    return -1.0
}

//function to get the salary and print all employees have it
func printEmps(salary:Double, name:String){
    var n = 0
    print("Other employees have same salary:")
    for emp in employee.keys {
        if employee[emp] == salary && emp != name{
            print(emp)
            n += 1
        }
    }
    if n == 0 {
        print ("No employee has similar salary to that employee")
    }
    
}

//function finds the amount of tax upon given salary
func getTax(salary:Double) ->Double {
    if salary < 5000 {
        return salary * 0.15
    }
    else {
        return salary * 0.2
    }
}

//function to find and return the average of salaries
func getAvg() ->Double {
    var sum = 0.0
    for emp in employee.keys{
        sum += employee[emp]!
    }
    return sum/Double(employee.count)
}

fillData()
var choice = 0
repeat{
print("0. Exit\n1. The employee of the highest salary\n2. The employee name and salary of lowest salary\n3. Employees of similar salary of given name\n4. Tax for a given employee\n5. Average of all salaries\n\nChoose your option:")
choice = Int(readLine()!)!
switch choice {
case 0:
    print("thank you for using our service.. Bye")
case 1:
    print("The employee of highest salary is \(highestSalary())")
case 2:
    lowestSalary()
case 3:
    print("Enter an employee name")
    let name = readLine()!
    let sal = getSalary(name: name)
    if sal == -1.0 {
        print("the given name is not found")
    }
    else{
        print("the salary of given employee = \(sal)")
        printEmps(salary: sal, name: name)
    }
case 4:
    print("Enter an employee name to find their tax:")
    let empName = readLine()!
    let empSal = getSalary(name: empName)
    if empSal == -1.0{
        print("the given employee is not found")
    }
    else {
        print("The tax for this employee = \(getTax(salary: empSal))")
    }
case 5:
    print("the average of all salaries = \(getAvg())")
default:
    print("Sorry, wrong choice")
}
}while choice != 0

