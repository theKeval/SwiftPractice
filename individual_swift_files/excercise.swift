import Foundation

var productNames = [String] ()
var productPrices = [Double] ()

func getProducts() {

    var more: Bool = false

    repeat{
        print("Enter the name of product: ")
        productNames.append(readLine()!)

        print("Enter the price of that product: ")
        productPrices.append(Double(readLine()!)!)

        var input: String
        repeat {
            print("want to add more elements?: yes/no")
            input = readLine()!
            more = input == "yes"
        } while (input == "yes" && input == "no")
    }
    while(more)

}

func getTax(price: Double) -> Double {
    return price * 0.13
}

func getGrandTotal(price: Double, quantity: Int, tax: Double) -> Double {
    return (price * Double(quantity)) + getTax(price: price)
}

func main() {

    // ask user to enter product names and it's prices
    getProducts()

    // variable declarations
    var selectedProductName: String = ""
    var selectedProductPrice: Double = Double(0)
    var quantity: Int = 1
    var grandTotal: Double = Double(0)
    var more: Bool = false

    repeat {
        // ask user to select a product
        print("Select a product by entering it's name: ")
    selectedProductName = readLine()!

        // search the selected product name in array
        // if exists, show it's value OR if don't exist, show message
        for i in 0...productNames.count - 1 {
            if(productNames[i] == selectedProductName) {
                selectedProductPrice =  productPrices[i]
                print("Price of the selected product is: \(selectedProductPrice)")
                
                break
            }
            else {
                if(i == productNames.count - 1) {
                    print("The product name you entered, doesn't exist")
                }

                continue
            }
        }

        // ask for quantity of selected product
        print("Enter the quantity to buy: ")
        quantity = Int(readLine()!)!
        
        // calculate the grand total
        grandTotal += getGrandTotal(price: selectedProductPrice, quantity: quantity, tax: getTax(price: selectedProductPrice))

        // ask for more products
        var userInput: String = ""
        repeat {
            print("Do you want to buy more products? yes/no")
            userInput = readLine()!
        } while(userInput == "yes" || userInput == "no")
        
        more = userInput == "yes"
    }
    while (more)

    // show grand total of the products and thank you message
    print("Grand total of the products you bought is: \(grandTotal)")
    print("Please visit again! Thank You!")

}

main()