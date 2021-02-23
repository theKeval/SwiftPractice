//
//  TrashCode.swift
//  SwiftFinalTest
//
//  Created by Keval on 2/22/21.
//

import Foundation


//    let spiderMan = Movie(no: 12345, title: "Spider Man", year: 2017,
//                          cinema: ["Cineplex", "Trademax", "Rainbow"], income: [250, 340, 180])
//    let blackPanther = Movie(no: 23456, title: "Black Panther", year: 2018,
//                             cinema: ["Cineplex", "Cinemax"], income: [233, 420])
    


class TempMovie : Show {
    var cinema: [String]
    var income: [Double]     // in millions
    
    init(no: Int, title: String, year: Int, cinema: [String], income: [Double]){
        self.cinema = cinema
        self.income = income
        
        super.init(no: no, title: title, year: year)
    }
    
    func findIncome() {
        
    }
}

