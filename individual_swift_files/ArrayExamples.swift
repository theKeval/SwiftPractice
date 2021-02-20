import Foundation

var fruits = ["apple", "orange", "banana"]
print(fruits)

fruits.append("grapes")
print(fruits)

fruits.insert("pear", at: 1)
print(fruits)

fruits += ["water melon", "apricot"]
print(fruits)

fruits[3...4] = ["abc", "xyz"]

fruits.sort()
fruits.reverse()

// for var i in 0..<fruits.count {
//     print(i)
// }

// for var i in 0...fruits.count-1 {
    
// }

if fruits.contains("orange") {
    print("yes")
}

for fr in fruits {
    if fr == "Orange" {
        print("yes")
    }
    else {
        if(fr == fruits.last) {
            print("no")
        }
        else {
            continue
        }
    }
}

// fruits.index(of: "Orange")

// let the user enter a name of fruit to find

