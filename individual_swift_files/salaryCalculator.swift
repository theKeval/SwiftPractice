import Foundation

var empName: String = ""
var monthlySalary: Double = Double(0)
var empRank: Int = 0
var tax = Double(0)
var bonus = Double(0)

func getTax(salary: Double) -> Double {
    // var tax = 0.0

    return tax
}

func getBonus(salary: Double, rank: Int) -> Double {
    // var bonus = 0.0

    return bonus
}

func main() {
    print("Enter Name of employee: ")
    empName = readLine()!

    print("Enter the monthly salary: ")
    monthlySalary = Double(readLine()!)!

    print("Enter the employee rank: ")
    empRank = Int(readLine()!)!

    tax = getTax(salary: monthlySalary)
    bonus = getBonus(salary: monthlySalary, rank: empRank)
}

main()

