import Foundation

var employee = [String: Double] ()

func addEmployees() {
    while true {
        print("Enter Employee name: ")
        let name = readLine()!

        print("Enter this employee's salary: ")
        let salary = Double(readLine()!)!

        employee[name] = salary

        print("press 0 to finish adding employees OR any other number to continue.")
        if Int(readLine()!)! == 0 {
            break
        }
    }
}

func printHighestPaidEmp() {
    // var _maxSalary = employee.values.first
    let maxSalary = employee.values.max()!
    // var highestPaidEmps = [String]()
    var str = "Highest paid employees are "

    for item in employee.keys {
        if employee[item] == maxSalary {
            str += item + " "
        }
    }

    str += "and their salaries are \(maxSalary)"

    print(str)
}

func printLowestPaidEmpWithSalary() {
    let lowestSalary = employee.values.min()!
    var str = "Employees with lowest salaries are "

    for item in employee.keys {
        if employee[item] == lowestSalary {
            str += item + " "
        }
    }

    str += "and their salaries are \(lowestSalary)"
    print(str)
}

func getEmpsWithSimilarSalary(selectedEmp: String, salary: Double) -> [String] {
    var emps = [String] ()

    for emp in employee.keys {
        if employee[emp] == salary && emp != selectedEmp {
            emps.append(emp)
        }
    }

    return emps
}

func main() {
    addEmployees()

    let check1 = false
    repeat {

        print("The Menu \n0. Exit \n1. The employee of the highest salary \n2. The employee name and salary of lowest employee \n3. Employees of similar salaries of given name \n4. Tax for a given employee \n5. Avarage of all salaries")

        let userChoice = Int(readLine()!)

        switch userChoice {
            case 0:
                print("Thank you for using our services!")

            case 1:
                printHighestPaidEmp()

            case 2:
                printLowestPaidEmpWithSalary()
            
            case 3:
            var check2 = ""
            repeat {
                print("Enter the employee name: ")
                let selectedEmp = readLine()!
                if employee.keys.contains(selectedEmp) {
                    
                    let selectedSalary = employee[selectedEmp]!
                    let str = "Salary of \(selectedEmp) is \(selectedSalary)"
                    var otherStr = "And employees with similar salaries is/are "

                    for item in employee {
                        if item.value == selectedSalary && item.key != selectedEmp {
                            otherStr += item.key + " "
                        }
                    }

                    print(str)
                    print(otherStr)
                }
                else {
                    print("employee name you entered doesn't exist. Would you like to search for another employee? yes/no")
                    check2 = readLine()!
                }
            } while (check2 == "no")

            case 4:
                break

            case 5:
                break

            default:
                print("Please enter valid response")
            
        }
        

    } while(check1)
}

main()
