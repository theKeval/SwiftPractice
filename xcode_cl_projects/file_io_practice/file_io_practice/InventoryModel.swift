//
//  InventoryModel.swift
//  file_io_practice
//
//  Created by Keval on 2/20/21.
//

import Foundation

class InventoryModel {
    var pId: Int
    var pName: String
    var pPrice: Double
    var pStock: Int
    
    init(id: Int, name: String, price: Double, stock: Int) {
        self.pId = id
        self.pName = name
        self.pPrice = price
        self.pStock = stock
    }
    
}
