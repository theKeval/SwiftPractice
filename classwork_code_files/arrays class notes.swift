// Arrays


import Foundation

var fruit = ["apple","orange","banana"]
print (fruit)
fruit.append("grapes")
print(fruit)
fruit.insert("pear",at:1)
print(fruit)
fruit += ["water melon","apricot"]
print(fruit)

//find and print the index of the oragne in the array
for i in 0..<fruit.count{
    if fruit[i] == "orange"{
        print ("the index of oragne = \(i)")
    }
}

//let the user enter a name of fruit and check if exists in the array
print("enter a fruit to find:")
let targetFruit = readLine()!
if fruit.contains(targetFruit){
    print ("exists")
}
else {
    print("not doesn't ")
}
var flag = true
for fr in fruit {
    if fr == targetFruit {
        print ("yes")
        flag = false
    }
    
}
if flag {
    print("no")
}

