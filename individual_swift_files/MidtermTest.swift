
import Foundation

// Dictionary to hold month name and it's bills
var electricityBills = [String: Double] ()
// array to hold just months name
var monthsList = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]

// Ask user to enter the bill for all months one by one
func addBills() {

    // loop through the name of months list and add it to the dictionary
    for month in monthsList {
        print("Add the bill for \(month):")
        electricityBills[month] = Double(readLine()!)!
    }
    
}

// Task 1 -> Ask the user to select the month and print the amount of bill for that month.
func taskOne() {
    print("\nTask 1 :-")

    var wrongInput = false
    // repeat until user enters the correct month name
    repeat {
        print("Please enter the name of a month to get it's bill: ")
        let selectedMonth = readLine()!

        // check if selected month exist or not
        if electricityBills.keys.contains(selectedMonth) {
            wrongInput = false
            // get and print selected month bill
            print("Bill for \(selectedMonth) is \(String(format: "%.2f", electricityBills[selectedMonth] ?? 0)).")
        }
        else {
            wrongInput = true
            print("Selected month does not exist.\nMake sure you have entered all characters in small letter and correct spelling")
        }

    } while(wrongInput)

}

// Task 2 -> Find and print the average of all bills
func taskTwo() {
    print("Task 2 :-")

    // holds the sum of all month bills
    var sum = Double(0)

    // loop through the dictionary to get the sum of all bills
    for month in electricityBills.keys {
        sum += electricityBills[month]!
    }
    
    // calculate the average by deviding the sum with 12 which is number of months
    print("Average of all bills is: \(String(format: "%.2f", sum/12))")
    
}

// function to calculate the average of given quarter and return the average
func quarterAvg(quarter: String) -> Double {

    // add the bills of months in specific quarter and devide by number of months in a quarter
    switch quarter {
        case "First Quarter":
            return (electricityBills["january"]! + electricityBills["february"]! + electricityBills["march"]!) / 3

        case "Second Quarter":
            return (electricityBills["april"]! + electricityBills["may"]! + electricityBills["june"]!) / 3

        case "Third Quarter":
            return (electricityBills["july"]! + electricityBills["august"]! + electricityBills["september"]!) / 3

        case "Fourth Quarter":
            return (electricityBills["october"]! + electricityBills["november"]! + electricityBills["december"]!) / 3
            
        default:
            // return 0 if something goes wrong
            return 0
    }

}

// Task 3 -> Find and print the average of each quarter of the year. So print the quarter number and its average.
func taskThree() {
    print("Task 3 :-")

    // holds the names of quarters
    let quarterNames = ["First Quarter", "Second Quarter", "Third Quarter", "Fourth Quarter"]

    print("Quarterly average bills:")

    // loop through the quarter names and calculate the 
    for quarter in quarterNames {
        // use the function quarterAvg() to find the average of quarter and then print
        print("\(quarter): \(String(format: "%.2f", quarterAvg(quarter: quarter)))")
    }

}

// Task 4 -> Print names of months which their bills more than 75$
func taskFour() {
    print("Task 4 :-")

    // dictionary to hold the name and bill amount of months which bill is more than $75
    var costlyMonths = [String: Double]()

    // loop through all month bills
    for monthBill in electricityBills {
        
        // check if bill amount is > $75 and add that month to dictionary
        if monthBill.value > 75 {
            costlyMonths[monthBill.key] = monthBill.value
        }
    }

    // check if no month bill is > $75
    if costlyMonths.keys.count > 0 {
        print("Months with bill more than $75: ")
        // loop through the costly bills and print it's value
        for month in costlyMonths {
            print("\(month.key) bill: \(String(format: "%.2f", month.value))")
        }
    }
    else {
        print("No month has more bill than $75")
    }
}

// Task 5 -> Print the name of the month that has the minimum bill amount
func taskFive() {

    // take the first month bill as minimum to start with the check
    var minBill = electricityBills[electricityBills.keys.first!]!
    // dictionary of month and bill if there are more than one month which bill is same minimum amount
    var minBillMonths = [String: Double] ()

    // loop through all bills to check the minimum amount
    for monthsBills in electricityBills {
        if monthsBills.value < minBill {
            minBill = monthsBills.value
        }
    }

    // loop through all bills and check if more than one month have same minimum amount
    for months in electricityBills {
        if months.value == minBill {
            minBillMonths[months.key] = minBill
        }
    }

    // check to see if there's only one month having minimum amount or more months have same minimum amount
    if minBillMonths.keys.count > 1 {
        print("Months with minimum bills are: ")
        for item in minBillMonths {
            print("\(item.key): \(item.value)")
        }
    }
    else {
        print("Minimum Billing month is: \(minBillMonths.first?.key ?? ""). and it's bill is: \(minBillMonths.first?.value ?? 0)")
    }
}

// making main function as starting point of porgram
func main() {
    print("We need bills for 12 months january to december.\n")
    addBills()

    // Task 1
    taskOne()
    print("\n")

    // Task 2
    taskTwo()
    print("\n")

    // Task 3
    taskThree()
    print("\n")

    // Task 4
    taskFour()
    print("\n")

    // Task 5
    taskFive()
    

    print("\nThank you for using our services!\n")    
    
}

// calling main to start the program
main()
