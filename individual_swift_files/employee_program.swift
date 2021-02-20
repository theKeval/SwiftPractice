//
//  practice1.swift
//  swift_test1
//
//  Created by Keval on 2/12/21.
//

import Foundation

class EmployeeProgram {
    
    var employee = [String: Double] ()
    
    func getEmployees() {
        
        while true {
            print("Add employee name: ")
            let name = readLine()!
            
            print("Add that employee's salary: ")
            let salary = Double(readLine()!)!
            
            employee[name] = salary
            
            print("press 0 to stop entering new employees, or press any other number to continue.")
            if Int(readLine()!)! == 0 {
                print(employee)
                break
            }
        }
        
    }
    
    func start() {
        getEmployees()
        
        print("The Menu \n0. Exit \n1. The employee of the highest salary \n2. The employee name and salary of lowest employee \n3. Employees of similar salaries of given name \n4. Tax for a given employee \n5. Avarage of all salaries")
        
        var userChoice = Int(readLine()!)!
        switch userChoice {
            case 0:
                print("Thank you for using our services.")
                // employee.values.max()
            
            default:
                print("Please enter a valid response.")
                userChoice = Int(readLine()!)!
        }
    }
    
}
