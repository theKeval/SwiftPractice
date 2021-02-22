// File in Swift

// in Xcode :


import Foundation
class Product{
    var prNo:Int
    var prName:String
    var prPrice:Double
    var prStock:Int
    init(no:Int, name:String, price:Double, stock:Int) {
        self.prNo = no
        self.prName = name
        self.prPrice = price
        self.prStock = stock
    }
  func fileFormat() ->String
  {
    let line = String(self.prNo)+","+self.prName+","+String(self.prPrice)+","+String(self.prStock)+"\n"
    return line
  }
    func printProduct()
    {
        print("Product No:\(self.prNo)\tProduct Name:\(self.prName)\tProduct Price:\(self.prPrice)\tProduct Stock:\(self.prStock)")
    }
}

//create an empty array of products
var products = [Product]()


//defining the location of the file
let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

//defining the file by its name and txt as extension
let fileURL = URL(fileURLWithPath: "products_data", relativeTo: directoryURL).appendingPathExtension("txt")

func readingFromFile(){
 //   let stringURL = "https://filebin.net/q25oaf4oq3kakhen/products_data.txt?t=sradlxun"
  let stringURL = "http://m.uploadedit.com/busd/161365795599.txt"
if let url = NSURL(string: stringURL) {
   do {
       let data = try String(contentsOf: url as URL)
       print("from the file")
       print (data)
       }
      catch {
        print("Cannot load contents")
      }
   }
  else {
      print("String was not a URL")    }
   }




func readingFromFile2(){
do {
 // Get the saved data all the contnt of the text file as data
 let savedData = try Data(contentsOf: fileURL)
 // checking if we can convert the data into a string
    if String(data: savedData, encoding: .utf8) != nil {
    //get the contect of the file as string
    let data = String(decoding: savedData, as: UTF8.self)
        //get lines by line of the text file
    let lines = data.split(whereSeparator: \.isNewline)
    for line in lines{
        //split each line into words which are fields
        let fields = line.components(separatedBy: ",")
        //create an object of Product assuming the separated words are the inputs
        let prod = Product(no:Int(fields[0])!,name:fields[1],price:Double(fields[2])!,stock:Int(fields[3])!)
        products.append(prod)//add the object product to the array of products
    }
 }
} catch {
 // Catch any errors
 print("Unable to read the file")
}
}
readingFromFile()
/*for pr in products{
    print(pr.printProduct())
}
*/




// // online:

// import Foundation
// class Product{
//     var prNo:Int
//     var prName:String
//     var prPrice:Double
//     var prStock:Int
//     init(no:Int, name:String, price:Double, stock:Int) {
//         self.prNo = no
//         self.prName = name
//         self.prPrice = price
//         self.prStock = stock
//     }
//   func fileFormat() ->String
//   {
//     let line = String(self.prNo)+","+self.prName+","+String(self.prPrice)+","+String(self.prStock)+"\n"
//     return line
//   }
//     func printProduct()
//     {
//         print("Product No:\(self.prNo)\tProduct Name:\(self.prName)\tProduct Price:\(self.prPrice)\tProduct Stock:\(self.prStock)")
//     }
// }

// //create an empty array of products
// var products = [Product]()


// //defining the location of the file
// let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]

// //defining the file by its name and txt as extension
// let fileURL = URL(fileURLWithPath: "products_data", relativeTo: directoryURL).appendingPathExtension("txt")

// func readingFromFile(){
//  //   let stringURL = "https://filebin.net/q25oaf4oq3kakhen/products_data.txt?t=sradlxun"
//   let stringURL = "http://m.uploadedit.com/busd/161365795599.txt"
// if let url = NSURL(string: stringURL) {
//    do {
//        let data = try String(contentsOf: url as URL)
//        print("from the file")
//        print (data)
//        }
//       catch {
//         print("Cannot load contents")
//       }
//    }
//   else {
//       print("String was not a URL")    }
//    }




// func readingFromFile2(){
// do {
//  // Get the saved data all the contnt of the text file as data
//  let savedData = try Data(contentsOf: fileURL)
//  // checking if we can convert the data into a string
//     if String(data: savedData, encoding: .utf8) != nil {
//     //get the contect of the file as string
//     let data = String(decoding: savedData, as: UTF8.self)
//         //get lines by line of the text file
//     let lines = data.split(whereSeparator: \.isNewline)
//     for line in lines{
//         //split each line into words which are fields
//         let fields = line.components(separatedBy: ",")
//         //create an object of Product assuming the separated words are the inputs
//         let prod = Product(no:Int(fields[0])!,name:fields[1],price:Double(fields[2])!,stock:Int(fields[3])!)
//         products.append(prod)//add the object product to the array of products
//     }
//  }
// } catch {
//  // Catch any errors
//  print("Unable to read the file")
// }
// }
// readingFromFile()
// /*for pr in products{
//     print(pr.printProduct())
// }
// */
