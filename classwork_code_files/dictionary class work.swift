
// The products example with dictionary

import Foundation

//Create the dictionaoty 
var products = [String:Double]()
var grandTotal = 0.0
//function for reading and filling the data in ghe dictionary 
func fillData()
{
    var choice = 0
    repeat {
        print("Enter the product name:")
        let name = readLine()!
        print("Enter the product price:")
        let price = Double(readLine()!)!
        products[name] = price
        print("press 0 to stop or any number to add more proeducts")
        choice = Int(readLine()!)!
    }while choice != 0
}
//function to search for a product and return its price or -1 if not found
func getPrice(name:String) -> Double
{
    for prod in products.keys {
        if prod == name{
            return products[prod]! //this means the price
        }
    }
    return -1.0
}
fillData()
print(products)
var answer = "yes"
repeat{
print("Enter the name of the required product:")
let reqProd = readLine()!
let prodPrice = getPrice(name:reqProd)
if prodPrice == -1.0 {
    print("Sorry the product is not available")
}
else{
    print("The price of the required peoduct = \(prodPrice)")
    print("Enter the required quantity:")
    let qty = Double(readLine()!)!
    let total = qty * prodPrice * 1.13
    grandTotal += total
}
print("Do you want to buy another product?yes/no")
answer = readLine()!
}while answer == "yes"
print("The total amount = \(String(format:"%.2f",grandTotal))")