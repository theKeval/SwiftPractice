//
//  Show.swift
//  SwiftFinalTest
//
//  Created by Keval on 2/22/21.
//

import Foundation

// Super class to hold Shows
class Show {
    var no: Int
    var title: String
    var year: Int
    
    init(no: Int, title: String, year: Int) {
        self.no = no
        self.title = title
        self.year = year
    }
    
    // returns the income after calculating
    func findIncome() -> Double{
        // here we will find income for separate shows
        return 0.0
    }
    
    // returns the string by concating the vaiable name and values
    func getString() -> String {
        return "number: \(String(no)), title: \(title), year: \(String(year))"
    }
}

class Movie: Show {
    var cinemaIncome: [String: Double]

    init(no: Int, title: String, year: Int, cineIncome: [String: Double]){
        self.cinemaIncome = cineIncome

        super.init(no: no, title: title, year: year)
    }
    
    // returns the income after calculating
    override func findIncome() -> Double {
        var totalIncome = Double(0)
        for (_, income) in cinemaIncome {
            // cinema takes 40% of a movie income
            // so here we are considering 60% of income from a cinema
            totalIncome += (income*0.6)
        }
        
        return totalIncome
    }
    
    // returns the string by concating the vaiable name and values
    override func getString() -> String {
        var str = super.getString() + ", "
        for cinemas in cinemaIncome {
            str += cinemas.key + ": " + String(cinemas.value) + ", "
        }
        
        return str
    }
    
}

class Series : Show {
    var noEpisodes: Int
    var noChannels: Int
    
    init(no: Int, title: String, year: Int, noChannels: Int, noEpisodes: Int) {
        self.noChannels = noChannels
        self.noEpisodes = noEpisodes
        
        super.init(no: no, title: title, year: year)
    }
    
    // returns the income after calculating
    override func findIncome() -> Double {
        let fixedIncome = Double(50_000)
        
        return (fixedIncome * Double(noChannels)) * Double(noEpisodes)
    }
    
    // returns the string by concating the vaiable name and values
    override func getString() -> String {
        return "\(super.getString()), noEpisodes: \(String(noEpisodes)), noChannels: \(String(noChannels))"
    }
}

// Enum type for available shows
enum ShowTypes {
    case movie
    case series
    case unknown
}

