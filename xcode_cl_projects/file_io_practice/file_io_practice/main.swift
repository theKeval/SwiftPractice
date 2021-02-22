//
//  main.swift
//  file_io_practice
//
//  Created by Keval on 2/20/21.
//

import Foundation

var products = [ProductModel]()

while(true) {
    print("Enter product Name: ")
    let name = readLine()!
    
    print("Enter price of product: ")
    let price = Double(readLine()!)!
    
    let prod = ProductModel(name: name, price: price)
    products.append(prod)
    
    print("press 0 to stop or any other number to continue")
    if Int(readLine()!)! == 0 {
        break
    }
}

let localJson = LocalJson()

let jsonString = localJson.getJsonString(of: products)
localJson.saveJsonFile(of: jsonString)


