//
//  main.swift
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





// array of class type 'Show'
var showsCollection = [Show]()

// function to fill the predefined data into array showsCollection
func fillData() {
    let spiderMan = Movie(no: 12345, title: "Spider Man", year: 2017,
                          cineIncome: ["Cineplex": 250000000, "Trademax": 340000000, "Rainbow": 180000000])
    let blackPanther = Movie(no: 23456, title: "Black Panther", year: 2018,
                             cineIncome: ["Cineplex": 233000000, "Cinemax": 420000000])

    let strangerThings = Series(no: 45678, title: "Stranger Things", year: 2016, noChannels: 36, noEpisodes: 6)
    let gameOfThrones = Series(no: 76543, title: "Game of Thrones", year: 2019, noChannels: 75, noEpisodes: 9)
    let theGoodPlace = Series(no: 98712, title: "The Good Place", year: 2018, noChannels: 45, noEpisodes: 3)

    showsCollection.append(spiderMan)
    showsCollection.append(blackPanther)
    showsCollection.append(strangerThings)
    showsCollection.append(gameOfThrones)
    showsCollection.append(theGoodPlace)
    
}

// for testing purpose, pring the data
func printData() {
    for show in showsCollection {
        print(show.getString())
    }
}

// for Task 1 - pring the Movie or Series name with it's calculated income
func printShowsIn2018() {
    for show in showsCollection {
        if show.year == 2018 {
            print("\(show.title) : total income is \(show.findIncome())")
        }
    }
}

// this function takes show number as argument
// and returns the compound value with ShowType enum and nullable Show object
func isMovie(showNo: Int) -> (ShowTypes, Show?) {
    for show in showsCollection {
        if showNo == show.no {
            if show is Movie {
                return (ShowTypes.movie, show)
            }
            else if show is Series {
                return (ShowTypes.series, show)
            }
        }
    }

    return (ShowTypes.unknown, nil)
}



// starting execution

fillData()
printData()


print("\nTask - 1 \nMovies or Series transmitted in 2018 are as below:\n")
// calling function to pring the movies and series
// transmitted in year 2018
printShowsIn2018()


print("\n\nTask - 2")
var validResponse = true

// loop until user enters the correct number of movie or series
repeat {
    
    print("Please enter a number of movie or series: ")
    let showNo = Int(readLine()!)!      // getting the number of show
    
    // function call to check whether the entered number is movie or series
    let check = isMovie(showNo: showNo)

    // conditions for enum ShowType
    switch check.0 {
    
        // if the entered number is of Movie
        case ShowTypes.movie:
            print("It's a movie")
            var cinemaString = ""
            let mov = check.1 as! Movie
            for str in mov.cinemaIncome {
                cinemaString += str.key + ", "
            }
            print("movie title is: \(mov.title). \nIt is transmitted in cinemas: \(cinemaString)")
            validResponse = true

        // if the entered number if of Series
        case ShowTypes.series:
            print("It's a series")
            let ser = check.1 as! Series
            print("Series title is: \(ser.title).\nIt has  \(String(ser.noEpisodes))  episodes.")
            validResponse = true

        // if uesr enterd number does not exist in our array
        case ShowTypes.unknown:
            print("The number you entered does not exist in our records.")
            validResponse = false
            
    }
    
} while !validResponse  // condition to check until user enters availble number



print("\n\n Task - 3")
print("Enter a Cinema name to see transmitted movies: ")
let cineName = readLine()!  // getting cinema name fro user
var movieNames = ""     // string containing all the movie names

// looping the array
for show in showsCollection {
    
    // switch condition to check type of show
    // we need to check the cinema name only if the show if Movie
    if isMovie(showNo: show.no).0 == ShowTypes.movie {
        
        // convert the current item in Movie Class type
        let mov = show as! Movie
        
        // loop through the dictionary of cinema name and income
        // to check the name of cinema
        for item in mov.cinemaIncome {
            if item.key.lowercased() == cineName.lowercased() {
                // concate the string if the cinema name is same
                movieNames += show.title + ", "
            }
        }
    }
    
}

// print the name of movies
print("Movies transmitted in \(cineName): \(movieNames)")


