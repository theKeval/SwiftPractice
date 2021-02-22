//
//  practice.swift
//  file_io_practice
//
//  Created by Keval on 2/22/21.
//

import Foundation

class Meh {
    func main() {
        let abc = [String]()
        var dict = [String: Int]()
        dict["key"] = 32

        let arr: [Int] = [1, 2, 3, 4, 5]

        for num in 0 ... 5 {
            print("\(num)")
        }
        
        print("\(abc) + \(arr)")
        
        // let path = NSSearchPathForDirectoriesInDomains()
    }
    
    func greet(_ person: String, on day: String) -> String {
        return person + " " + day
    }
    
    func check() {
        print(greet("person name", on: "Monday"))
    }
    
    // Example of Closure
    func anotherCheck() {
        let abc = [1, 2, 3, 4, 5]
        // long way
        let bb = abc.map { (num: Int) -> Int in
            let aa = 3 * num
            return aa
        }
        
        // short way
        let cc = abc.map { num in num * 4 }
        
        print(bb + cc)
    }
    
    var sideLength: Double = 0
    var abc: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
            _ = newValue
        }
    }
}

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
}

struct Abc {
    var xyz: String
}

struct RestaurantRow {
    let rests = [
        Restaurant(name: "working")
    ]
    let xx = [
        Abc(xyz: "Working")
    ]
}
