/*
Suppose we have products and for each products we have name, price, stock
Create 2 dictionaries 
name:price
name:stock

We need to fill the data then
ask the user to enter the name and the quantity of required product 
Then check if the product is exist and if the required quantity is available
if the product is not exist show a message
if the products is exist but the stock not enough show a message says the product is available but we have only ..stock... do you want another quantity?

Put in regards that if the required quantity is 10+ to give a 5% discount for the products. 


Example :
Prices: Gloves:7.5, Mask:13, Sanitizer:9.6

Stock: Gloves:20, Mask:100, Sanitizer:15 

Finally you have to print out the total amount.
Let the user buy as many products as they want

*/

import Foundation

//Create the dictionaries 

var productsPrices = [String:Double]()
var productsStock = [String:Double]()
//
func fillProductsData()
{
    var choice = 0
    repeat {
        print("Enter the product name:")
        let name = readLine()!
        print("Enter the product price:")
        let price = Double(readLine()!)!
        productsPrices[name] = price
        print("Enter the product stock quantity:")
        let stock = Double(readLine()!)!
        productsStock[name] = stock
        print("press 0 to stop or any number to add more products")
        choice = Int(readLine()!)!
    }while choice != 0
}

//function to search for a product and return its price or -1 if not found
func getPrice(name:String) -> Double
{
    for prod in productsPrices.keys {
        if prod == name{
            return productsPrices[prod]! //this means the price
        }
    }
    return -1.0
}

//function to search for a product and return its stock quantity or -1 if not found
func getStock(name:String) -> Double
{
    for prod in productsStock.keys {
        if prod == name{
            return productsStock[prod]! //this means the stock
        }
    }
    return -1.0
}
//function to search for a product and return its stock quantity or -1 if not found
func setStock(name:String, value:Double)
{
    for prod in productsStock.keys {
        if prod == name{
            productsStock[prod] = Double(productsStock[prod]!) - Double(value) //this means the stock
        }
    }
}

fillProductsData()
var grandTotal = 0.0
var answer = "yes"
repeat{
    // gets the required product
    print("Enter the name of the required product:")
    let reqProd = readLine()!
    let prodPrice = getPrice(name:reqProd) // gets the product price if exists
    if prodPrice == -1.0 {
        print("Sorry the product is not available")
    }else{
        let prodStock = getStock(name:reqProd) // gets the product stock qty
        print("The price of the required product = $\(prodPrice)")
        
        print("Enter the required quantity: ")
        var qty = Double(readLine()!)!
        while(qty > prodStock){ // blocks the user while indicates a valid number or 0 to continue
            print("The product is available but we have only \(prodStock), please indicate another quantity or '0' to skip this product")
            print("Enter the required quantity:")
            qty = Double(readLine()!)!
        }
        if (qty > 0){
            var discount = 0.0
            if(qty >= 10){
                discount = 0.05
            }
            grandTotal += Double(qty) * Double(prodPrice) * (1.13 - Double(discount))
            setStock(name:reqProd, value:qty )

        }
    }
    print("Do you want to buy another product?yes/no")
    answer = readLine()!
}while answer == "yes"
print("The total amount = \(String(format:"%.2f",grandTotal))")