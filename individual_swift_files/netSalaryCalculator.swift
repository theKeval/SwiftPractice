import Foundation

var name: String = ""
var monthlySalary: Double = 0
var rank: Int = 0
var netSalary: Double = 0
var moreEmployee = false

// calculate net salary
func getNetSalary(salary: Double, _rank: Int) -> Double {
    var netSalary: Double = 0.0
    let annualSalary: Double = salary * 12
    
    // calculate and deduct the tax
    if (annualSalary > 85000) {
        netSalary = salary - ((24*salary)/100)
    }
    else if(annualSalary > 65000) {
        netSalary = salary - ((19*salary)/100)
    }
    else if(annualSalary > 50000) {
        netSalary = salary - ((13*salary)/100)
    }
    else {
        netSalary = salary
    }
    
    // calculate and add bonus
    switch _rank {
        case 1:
            netSalary = netSalary + ((10*netSalary)/100)
        case 2:
            netSalary = netSalary + ((7*netSalary)/100)
        case 3:
            netSalary = netSalary + ((3*netSalary)/100)
        default:
            netSalary += netSalary
    }
    
    return netSalary
}

repeat {

    // ask user to enter name of employee
    print("Enter the Name of employee: ")
    name = readLine()!
    
    // ask user to enter monthly salary of that user
    print("Enter the monthly salary of this employee: ")
    monthlySalary = Double(readLine()!)!
    
    // ask for the rank of the employee
    print("Enter the rank of this employee:\nenter 1 - for rank 1\nenter 2 - for rank2\nenter 3 - for rank 3")
    rank = Int(readLine()!)!
    
    
    
    // use the function to get the net salary
    netSalary = getNetSalary(salary: monthlySalary, _rank: rank)
    
    // print the net salary
    print("Net salary of \(name) is: \(netSalary)")
    
    print("do you have more employees?: type yes/no")
    moreEmployee = readLine()! == "yes"
    
} while (moreEmployee)
