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

func readingFromOnlineFile(){
 //   let stringURL = "https://filebin.net/q25oaf4oq3kakhen/products_data.txt?t=sradlxun"
  let stringURL = "http://m.uploadedit.com/busd/161365795599.txt"
if let url = NSURL(string: stringURL) {
   do {
       let data = try String(contentsOf: url as URL)
    let lines = data.split(whereSeparator: \.isNewline)
    for line in lines{
        //split each line into words which are fields
        let fields = line.components(separatedBy: ",")
        //create an object of Product assuming the separated words are the inputs
        let prod = Product(no:Int(fields[0])!,name:fields[1],price:Double(fields[2])!,stock:Int(fields[3])!)
        products.append(prod)//add the object product to the array of products
    }
       }
      catch {
        print("Cannot load contents")
      }
   }
  else {
      print("String was not a URL")    }
   }




func readingFromLocalFile(fileName:String){
do {
 // Get the saved data all the contnt of the text file as data
    let fileURL = URL(fileURLWithPath: fileName, relativeTo: directoryURL).appendingPathExtension("txt")
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

//reading form keyboard and fill the products array
func filling(){
    while(true){
        print("Enter product no:")
        let no = Int(readLine()!)!
        print("Enter product name")
        let name = readLine()!
        print("Enter product price:")
        let price = Double(readLine()!)!
        print("Enter product stock:")
        let stock = Int(readLine()!)!
        let obj = Product(no: no, name: name, price: price, stock: stock)
        products.append(obj)
        print("Do you want to add more products? y/n")
        let answer = readLine()!
        if answer == "n"{
            break
        }
    }
}

//function to save data to a file
func savingData(fileName:String){
    // calling the filling function
    let fileURL = URL(fileURLWithPath: fileName, relativeTo: directoryURL).appendingPathExtension("txt")
        filling()
        //merging all lines form the array in one string
        var myString:String = ""
        for pr in products{
            myString += pr.fileFormat()
        }
        //convert from string to data
        let data = myString.data(using: .utf8)
        do {
            //write the data into the file
            try data?.write(to: fileURL)
         print("File saved: \(fileURL.absoluteURL)")
        } catch {
         // Catch any errors
         print(error.localizedDescription)
        }
}

func updateData(){
    
        //merging all lines form the array in one string
        var myString:String = ""
        for pr in products{
            myString += pr.fileFormat()
        }
        //convert from string to data
        let data = myString.data(using: .utf8)
        do {
            //write the data into the file
            try data?.write(to: fileURL)
         print("File saved: \(fileURL.absoluteURL)")
        } catch {
         // Catch any errors
         print(error.localizedDescription)
        }
}

//To add more data to the exisiting file
func appendData(fileName:String){
    // get the content of the file
    readingFromLocalFile(fileName: fileName)
    //Add more content to the array then save the whole array again
    savingData(fileName:fileName)
   
}

//function to search for a product by number and return it
func searchByNo(no:Int) ->Product?{
    for pr in products{
        if pr.prNo == no{
            return pr
        }
    }
    return nil
}

//function search for a product by its no and return its index
func getIndex(no:Int) ->Int{
    for i in 0..<products.count{
        if products[i].prNo == no {
            return i
        }
    }
    return -1
}
//funtion to modify a product data by give its no.
func modifyProduct(no:Int){
    print("Enter product name:")
    let name = readLine()!
    print("Enter product price:")
    let price = Double(readLine()!)!
    print("Enter product stock:")
    let stock = Int(readLine()!)!
    let index = getIndex(no: no)
    products.remove(at: index)
    let prod = Product(no:no,name:name,price:price,stock: stock)
    products.append(prod)
    updateData()
}


print("0.Exit\n1.Create a new file with new data\n2.Overwrite exitising file with new data\n3.Add new data to an existing file\n4.Reading from a file\n5.Search for a product by its No.")
let choice = Int(readLine()!)!
repeat{
    switch choice {
    case 0: print ("Exiting the system. Good bye")
    case 1:print("Enter the file name:")
        let fileName = readLine()!
        savingData(fileName: fileName)
    case 2:print("Enter the file name:")
        let fileName = readLine()!
        savingData(fileName: fileName)
    case 3:print("Enter the file name:")
        let fileName = readLine()!
        appendData(fileName: fileName)
    case 4:print("Enter the file name:")
        let fileName = readLine()!
        readingFromLocalFile(fileName: fileName)
    case 5: print("Enter the product no:")
        let no = Int(readLine()!)!
        print(searchByNo(no: no)?.printProduct() ?? "")
        print("Do you want to change any valus of this product?y/n")
        if readLine()! == "y"{
           modifyProduct(no: no)
        }
    default: print("wrong choice")
        
    }
    print("Do you want another process?y/n")
}while(readLine()! == "y")



