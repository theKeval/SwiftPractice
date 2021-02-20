import Foundation

// dictionaries to hold prices and stock of products
var productPrices = [String: Double] ()
var productStock = [String: Int] ()

// total amount customer need to pay after purchainsg all products
var grandTotal = Double(0)

// ask user for the product details such as product name, price and available stock
func fillData() {
    var response1 = "no"
    repeat{
        print("Add the name of the product: ")
        let name = readLine()!

        print("Add the price of that product: ")
        let price = Double(readLine()!)!

        print("Add the stock of that product: ")
        let stock = Int(readLine()!)!

        // store price and stock in dictionaries
        productPrices[name] = price
        productStock[name] = stock

        // ask user if want to add more product
        print("Do you want to add more product details: yes/no ")
        response1 = readLine()!

    } while(response1 == "yes")

    // printing product price and it's stock dictionaries for reference
    print(productPrices)
    print(productStock)
}

// checks if the product does exist in the dictionary or not
func isProductExist(name: String) -> Bool {
    var exist = false

    // loop through the dictionaries to find the product name
    for item in productPrices {
        if item.key == name {
            exist = true
        }
    }

    return exist
}

// returns the available stock for the product from the dictionary
func getAvailableStock(name: String) -> Int {
    return productStock[name]!
}

// main method to execute the code
// we can put this code directly in the file but I'm keeping here for modularity
func main() {
    
    // calling the fill data method to ask user about product details
    fillData()

    // this variable holds the total cost of specific product
    // after calculating the price from the buying quantity and applying discount if applicable
    var productTotalCost = Double(0)

    var response1 = "no"
    // repeat asking to enter product name that user want to buy
    // until user enters no for further product purchase
    repeat{
        print("Enter name of product to buy: ")
        let selectedProduct = readLine()!

        // check if product exist
        if isProductExist(name: selectedProduct) {

            var response2 = "no"

            // repeat until if user requires more product quantity then available
            // and want to re-enter the quantity
            repeat {
                print("Enter the quantity you want: ")
                let selectedQuantity = Int(readLine()!)!

                // get the available stock from dictionary
                let availableStock = getAvailableStock(name: selectedProduct)

                // check if required quantity is available in stock or not
                if(availableStock >= selectedQuantity) {

                    // printing selected product detail just for reference
                    print("selected product: \(selectedProduct), it's price: \(productPrices[selectedProduct]!), available stock: \(availableStock), selected quantity: \(selectedQuantity)")

                    // calculate the product specific total cost according to required quantity
                    productTotalCost = Double(productPrices[selectedProduct]!) * Double(selectedQuantity)
                    print("total cost of \(selectedProduct) : \(productTotalCost)")
                        
                    // calculate the discount if buying more than 10 products
                    if selectedQuantity > 10 {
                        productTotalCost -= (productTotalCost * 0.05)
                        print("after applyint discount, total cost: \(productTotalCost)")
                        
                    }

                    // add the product cost to grand total
                    // to calculate the final amount that user need to pay
                    grandTotal += productTotalCost

                    // break this repeat if the user has entered the quantity which is available in stock
                    break
                }
                else {

                    // show user the available stock of product
                    // and ask if want to add quantity again
                    print("The product is available but we have only \(availableStock) in stock.")
                    print("Would you like to add another quantity? yes/no")
                    response2 = readLine()!
                }

            } while(response2 == "yes")

        }
        else {

            // prompt user if the entered name does not exist in the dictionary
            print("The product name you entered, does not exist!")
        }

        // ask user if want to add more product to card
        print("would you like to enter another product name? yes/no")
        response1 = readLine()!

    } while(response1 == "yes")

    // finally print the grand total amount which user need to pay
    print("Total cost of all products you bought is: \(grandTotal)")
    
}

// start execution by calling main method
main()
