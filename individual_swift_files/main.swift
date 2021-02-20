//
//  main.swift
//  classwork
//
//  Created by Keval on 2/10/21.
//

import Foundation

// print("Hello, World!")
var productDetails = [String: Double]()

func fillData() {
    var more: Int = 0
    repeat{
        print("Enter the product name: ")
        let name = readLine()!
        
        print("Enter the price: ")
        let price = Double(readLine()!)!
        
        productDetails[name] = price
        
        print("Enter 0 to stop or any number to add more products")
        more = Int(readLine()!)!
        
    } while more != 0
}

fillData()
print(productDetails)

