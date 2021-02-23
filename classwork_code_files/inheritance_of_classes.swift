// Class Inheritance
// Polymorphism
// override
// casting
// recognizing the sub class type of the object

import Foundation

class Shape {
    var x: Int
    var y: Int
    init(x:Int, y:Int){
        self.x = x
        self.y = y
    }
    //method to find the area
    func area() ->Double {
        return 0.0
    }
    
    
}
class Square: Shape {
    var side: Double
    init(x:Int, y:Int, side:Double){
        self.side = side
        super.init(x:x,y:y)
        
    }
    override func area() ->Double {
    
        print("This is the area of the Square:")
        return side * side
    }
}
class Rectangle: Square {
    var width: Double
    init(x:Int, y:Int, side:Double, width:Double){
    self.width = width
    super.init(x:x, y:y, side:side)
    }
    override func area() ->Double {
        print("This is the area of the Rectangle:")
        return side * width
    }
}
class Circle: Shape {
    var radius: Double
    init(x:Int, y:Int, radius:Double){
        self.radius = radius
        super.init(x:x,y:y)
    }
    override func area() ->Double
    {
        print("This is the area of the Circle:")
        return radius * radius * Double.pi
    }
    func printRaduis()
    {
        print(radius)
    }
}


//reacing and filling the data
func fillData() {
    repeat {
        print("Enter the position of the shape x and y")
        print("Enter the value of x:")
        let x = Int(readLine()!)!
        print("Rnter the value of y:")
        let y = Int(readLine()!)!
        print("Choose the shape: \n1. Square\n2.Rectangle\n3.Circle")
        switch Int(readLine()!)! {
            case 1:
            print("Enter the side")
            let side = Double(readLine()!)!
            shapes.append(Square(x:x,y:y,side:side))
            case 2:
            print("Enter the lenght")
            let length = Double(readLine()!)!
            print("Enter the width")
            let width = Double(readLine()!)!
            shapes.append(Rectangle(x:x,y:y,side:length,width:width))
            case 3:
            print("Enter the radius")
            let radius = Double(readLine()!)!
            shapes.append(Circle(x:x,y:y,radius:radius))
            default:
            print("wrong choice")
        }
        print("Do you want to add more shapes?yes/no")
    }while(readLine()! == "yes")
}

let sq = Square(x:5,y:15,side:10)
print(sq.area())
let req = Rectangle(x:10, y:20, side:15, width:10)
print(req.area())
let cir = Circle(x:15,y:30,radius:5)
print(cir.area())

//polymorphism is to use an object of the base class to call the same method but from different sub classes
var sh = Shape(x:10,y:20)
print(sh.area())
sh = Square(x:10,y:10,side:10)
print(sh.area())
sh = Rectangle(x:10,y:10,side:18,width:12)
print(sh.area())
sh = Circle(x:10,y:10,radius:7)
print(sh.area())

//create an array of objects of shapes
//the type of the object must be the base class to accept sub classes
var shapes = [Shape]()
fillData()
//printing areas of all shapes
/*for shp in shapes{
    print(shp.area())
} */

//print the area's of recangles only
//we need to recognize the type of the object which sub class
for shp in shapes {
    if shp is Circle{
        print((shp as! Circle).printRaduis()) //casting convert shp into Circle
    }
}
//To call any method using any object that method must exist inside the base class if not then you must cast (convert) the object inot the sub class then call the method
