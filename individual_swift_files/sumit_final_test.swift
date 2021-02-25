import Foundation

// creating the Show class
class Show{
    var number: Int
    var title: String
    var year: Int
    
    // initializer to assign values to class variables
    init(number: Int, title: String, year: Int){
        self.number = number
        self.title = title
        self.year = year
    }
}

// creating the Movie class which inherits the Show class
class Movie :  Show{
    // creating dictionary for storing the cinema name and income from that cinema
    var cinemaIncome: [String: Double] 

    init(number: Int, title: String, year: Int, cinemaIncome: [String: Double]){
        self.cinemaIncome = cinemaIncome
        
        // calling of initializer from the Show class, which is super class for the Movie class
        super.init(number: number, title: title, year: year) 
    }
    
}

// creating the Series class which inherits the Show class
class Series : Show{
    var episodes: Int
    var channels: Int
    
    init(number: Int, title: String, year: Int, episodes: Int, channels: Int){
        self.episodes = episodes
        self.channels = channels
        
        // calling of initializer from the Show class, which is super class for the Series class
        super.init(number: number, title: title, year: year)
    }
}

//creating objects for Movie
var movieObj1 = Movie(number: 12345, title: "Spider Man", year: 2017, cinemaIncome: ["Cineplex": 250.0, "Trademax": 340.0, "Rainbow": 180.0])
var movieObj2 = Movie(number: 23456, title: "Black Panther", year: 2018, cinemaIncome: ["Cineplex": 233.0,"Cinemax": 420.0])

//creating objects for Series
var seriesObj1 = Series(number: 45678, title: "Stringer things", year: 2016, episodes: 36, channels: 6)
var seriesObj2 = Series(number: 76543, title: "Game of thrones", year: 2019, episodes: 75, channels: 9)
var seriesObj3 = Series(number: 98712, title: "The good place", year: 2018, episodes: 45, channels: 3)

// creating array for storing the data (Show class is base class here)
var showList = [Show]()
showList.append(movieObj1)
showList.append(movieObj2)
showList.append(seriesObj1)
showList.append(seriesObj2)
showList.append(seriesObj3)

var totalOfMovie = [String:Double]()
var totalOfSeries = [String:Double]()

// creating function that calculate the income of all movies(and stores in totalOfMovie) and all series (and stores in totalOfSeries)
func totalIncomeOfShows(){
    for show in showList{
        if show is Movie{ // type checking for the object if its Movie or not
            let movie =  show as! Movie
            var sum1 = 0.0
            for (_ ,value) in movie.cinemaIncome{
                sum1 += value
            }
            sum1 = sum1 * 0.6 // Sum for movies will be only 60% as 40% is going for cinemas
            totalOfMovie[movie.title] = sum1
        }
        if show is Series{ // type checking for the object if its Series or not
            let series =  show as! Series
            // Sum for the series is 50K for each episode on each channel
            let sum2 = Double(series.episodes) * Double(series.channels) * Double(50000)
            totalOfSeries[series.title] = sum2
        }
    }
}

var totalOfMovie2018 = [String:Double]()
var totalOfSeries2018 = [String:Double]()

// creating function that  calculate and print the income of shows trasnmitted in year 2018
func incomeOfShowsin2018(){
    for show in showList{ // type checking for the object if its Movie or not
        if (show.year == 2018){ // checking for only shows trasnmitted in year 2018
            if show is Movie{
                let movie =  show as! Movie
                var sum1 = 0.0
                for (_ ,value) in movie.cinemaIncome{
                    sum1 += value
                }
                sum1 = sum1 * 0.6 // Sum for movies will be only 60% as 40% is going for cinemas
                totalOfMovie2018[movie.title] = sum1
            }
            if show is Series{ // type checking for the object if its Series or not
                let series =  show as! Series
                 // Sum for the series is 50K for each episode on each channel
                let sum2 = Double(series.episodes) * Double(series.channels) * Double(50000)
                totalOfSeries2018[series.title] = sum2
            }
        }
    }
    
    // printing the earning of all movies in 2018
    for (key, value) in totalOfMovie2018{
       print("Movie \(key) has earned \(value) M in 2018") 
    }
    
    // printing the earning of all series in 2018
    for (key, value) in totalOfSeries2018{
       print("Series \(key) has earned \(value) in 2018") 
    }
}

// creating function that ask show number to the user and print the name of ciname if its movie or print the number of episode if its serires
func cinemaNameOrEpisodeNumber(){
    print("Enter the show number:")
    let showNumber = Int(readLine()!)!
    var flag1 = 0
    
    for show in showList{
        if(show.number == showNumber){ // if user input and show number from object matches then go inside
            flag1 = 1
            if show is Movie{
                let movie = show as! Movie
                print("Movie \(movie.title) is released in below cinemas:")
                for (key, _) in movie.cinemaIncome{
                    print(key) // printing the name of cinemas
                }
            }
            if show is Series{
                let series = show as! Series
                print("Seires \(series.title) has total \(series.episodes) no. of episodes") // print the number of episodes
            }
        }
    }
    
    // if no matches found as per the user input then print the below message
    if(flag1 == 0){
        print("Sorry! Show number not exist!")
    }
}

// creating the function that ask for cinema name from user and print the name of movies having in that cinema
func movieNamesFromCinema(){
    print("Enter cinema name:")
    let cinemaName = readLine()!
    var flag = 0
    print("In \(cinemaName) cinema below movies are released:")    
    
    for show in showList{
        if show is Movie{ // type checking if the object is of Movie type or not
            let movie = show as! Movie // type casting of the show object to movie object
            for (key, _) in movie.cinemaIncome{
                if(key.lowercased() == cinemaName.lowercased()){
                    flag = 1
                    print(movie.title)
                }
            }
        }
    }
    
    // printing the below message if the cinema has no movies (or user enterd the different cinema)
    if(flag == 0){
        print("In \(cinemaName) cinema, no movies are there!")
    }
}

// calling the function which only calculate (not print) the income of all movies and all series
totalIncomeOfShows()

// calling the function that calculate and print  the income of shows trasnmitted in year 2018
incomeOfShowsin2018()

// calling function that prints cinema names if movies or number of episodes if series
cinemaNameOrEpisodeNumber()

// calling the function that print the movie name that released in the user enterd cinema
movieNamesFromCinema()
