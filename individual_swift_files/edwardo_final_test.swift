//
//  main.swift
//  finalExam
//
//  Created by Eduardo Cardona on 2/22/21.
//

import Foundation

/************************ CLASSES DEFINITION  **********************************/

// definition of Cinema Class to add cinemas into movies
class Cinema {
    var name: String // name of the cinema
    var income: Double // movie income in this cinema
    
    // constructor
    init (name:String, income:Double){
        self.name = name
        self.income = income
    }
}

// parent class for movies and series with the common attributes (no, year, title)
class RecordedStory {
    var storyNo:Int
    var storyYear:Int
    var storyTitle:String
    
    init (no:Int, year:Int, title:String){
        self.storyNo = no
        self.storyYear = year
        self.storyTitle = title
    }
    // global function to get the income
    func totalIncome() -> Double {
        return 0.0
    }
}


// subclass movie inherits from parent class
class Movie: RecordedStory {
    var movieCinemaArr: [Cinema] // arrays of cinema classes
    // constructor
    init (no:Int, year:Int, title:String, cinemaArr: [Cinema]){
        self.movieCinemaArr = cinemaArr
        // calling to parent constructor
        super.init(no:no, year:year, title:title)
    }
    // overriding of the global function to get the movie income
    override func totalIncome() -> Double {
        var total = 0.0
        for cinema in self.movieCinemaArr {
            total += (cinema.income * 0.6)
        }
        return total
    }
}

// subclass series inherits from parent class
class Series: RecordedStory {
    var seriesEpisodes: Int
    var seriesChannels: Int
    // constructor
    init (no:Int, year:Int, title:String, episodes:Int,channels:Int ){
        self.seriesEpisodes = episodes
        self.seriesChannels = channels
        // calling to parent constructor
        super.init(no:no, year:year, title:title)
    }
    
    // overriding of the global function to get the series income
    override func totalIncome() -> Double {
        return Double(self.seriesEpisodes) * Double(self.seriesChannels) * 50000.0
    }
    
}


/************************ CLASSES DEFINITION (END) **********************************/

/********************************* MAIN PROGRAM ************************************/



var stories = [RecordedStory]() // heterogeneous collection

//---------------------------------------------- FUNCTIONS -------------------------------------------------------

// function for filling the stories array
func filling(){
    // infinite loop for filling the array
    while(true){
        print("Add a new story\n")
        print("\nEnter story number:")
        let no = Int(readLine()!)! // gets Recorded Story Class attribute
        print("\nEnter story type:\n1. Movie\n2. Series")
        let storyType = Int(readLine()!)!// gets the type (movie - series)
        
        print("Enter title:")
        let title = readLine()! // gets Recorded Story Class attribute
        print("Enter release year:")
        let year = Int(readLine()!)! // gets Recorded Story Class attribute
        
        // switch case for the story type
        switch storyType {
        case 1: // filling the movie class attributes
            // cinema's array
            var movieCinemas = [Cinema]()
            print("\nAdding movie's Cinemas")
            //infinite loop for adding cinemas to the movie
            while(true){
                // filling the cinema class attributes
                print("\nEnter cinema's name:")
                let cinemaName = readLine()!
                print("Enter movie's income for this cinema:")
                let cinemaIncome = Double(readLine()!)!
                // adds the cinema to the arrary
                movieCinemas.append(Cinema(name:cinemaName, income:cinemaIncome))
                
                // asking for more cinemas
                print("Do you want to add more cinemas? y/n")
                let answer = readLine()!
                if answer == "n"{
                    break
                }
            }
            //Appending to the Stories array
            stories.append( Movie(no:no,year:year,title:title,cinemaArr:movieCinemas ) )
        case 2: // filling the series class attributes
            
            print("\nEnter the number of episodes")
            let episodes = Int(readLine()!)!
            print("Enter the number of channels the series was presented")
            let channels = Int(readLine()!)!
            //Appending to the Stories array
            stories.append(Series(no:no,year:year,title:title,episodes: episodes, channels: channels	))
        default:
            print("wrong choice")
        }
        print("\n\nDo you want to add more stories? y/n")
        let answer = readLine()!
        if answer == "n"{
            break
        }
        
    }
}


func storiesFrom18s(){
    //iterate all the Stories
    for story in stories {
        if (story.storyYear == 2018){ // get the ones released in 2018
            let income = story.totalIncome()
            // print name and income
            print("\nStory Name: \(story.storyTitle) Income: \(String(format: "%.2f", income) ) " )
        }
    }
}

// prints the story details (cinemas for Movies, no of episodes for series)
func storybyNo(no:Int){
    var storyFound = 0
    //iterate all the Stories
    for story in stories {
        // finds the story number
        if (story.storyNo == no){
            storyFound = 1 // increases the count to show the detail
            // checks what type of story is
            if story is Movie {
                
                print("\nCinemas presenting: \(story.storyTitle)" )
                // cast the story as Movie class to iterate cinemas
                for cinema in (story as! Movie).movieCinemaArr {
                    print(cinema.name)
                }			
                print("\n")
                
            }else if story is Series {
                // cast the story as Series class to show the episodes no.
                print("\nNumber of episodes for \(story.storyTitle) : \((story as! Series).seriesEpisodes)" )
            }
        }
    }
    // if no stories found
    if storyFound == 0 {
        print("No stories were found with number: \(no)")
    }
}

// prints the movies being presented in a specific cinema
func moviesbyCinemas(name:String){
    print("Movies being presented in \(name)")
    //iterate all the Stories
    for story in stories {
        // checks if the story is a movie
        if story is Movie {
            // cast the story as Movie class to iterate cinemas
            for cinema in (story as! Movie).movieCinemaArr {
                // if the cinema match with the entered name
                if(cinema.name == name){
                    // print the title 
                    print(story.storyTitle)
                }
            }
        }
    }
}

//---------------------------------------------- FUNCTIONS (END) -------------------------------------------------------


// ------------------------------------ PROGRAM RUNNING INSTRUCTIONS ------------------------------------------------
print("Hello and welcome!")
print("Let's start by adding some stories")
filling() // calling of the filling function


repeat {
    // menu
    print("\n What do you want to do?")
    print("1.Watch 2018 Stories")
    print("2.Search Story by number")
    print("3.Search movies by cinema name")
    
    switch Int(readLine()!)! {
    case 1:
        storiesFrom18s()
    case 2:
        print("\nEnter the story number")
        storybyNo(no:Int(readLine()!)!)
    case 3:
        print("\nEnter the cinema name")
        moviesbyCinemas(name:readLine()!)
    default:
        print("Wrong choice")
    }
    
    print("\n\nDo you want to do another process?y/n")
}while(readLine()! == "y")

// ------------------------------------ PROGRAM RUNNING INSTRUCTIONS (END) ------------------------------------------------

/********************************* MAIN PROGRAM (END)************************************/