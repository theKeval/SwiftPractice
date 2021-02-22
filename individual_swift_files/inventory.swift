import Foundation


func writeToFile(stringData: String) {

    // Create data to be saved
    // let myString = "Saving data with FileManager is easy!"
    guard let data = stringData.data(using: .utf8) else {
        print("Unable to convert string to data")
        return
    }
    // Save the data
    do {
        try data.write(to: fileURL)
        print("File saved: \(fileURL.absoluteURL)")
    } catch {
        // Catch any errors
        print(error.localizedDescription)
    }

}

func getDataFromUser() {
    while(true) {
        print("enter the product code: ")
        let pCode = Int(readLine()!)!

        print("enter the product name: ")
        let pName = readLine()!

        print("enter the price: ")
        let pPrice = Double(readLine()!)!

        print("enter the stock: ")
        let pStock = Int(readLine()!)!

        // stringData += "\n" + String(pCode) + ", " + pName + ", " + String(pPrice) + ", " + String(pStock)

        print("press 0 to exit OR any other number to add more data")
        if Int(readLine()!)! == 0 {
            return
        }
    }
}

func readDataFromFile() {
    do {
        // Get the saved data
        let savedData = try Data(contentsOf: fileURL)
        // Convert the data back into a string
        if let savedString = String(data: savedData, encoding: .utf8) {
            print(savedString)
        }
    } catch {
        // Catch any errors
        print("Unable to read the file")
    }
}


let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
let fileURL = URL(fileURLWithPath: "myFile", relativeTo: directoryURL).appendingPathExtension("txt")
let _onlineFileUrl = "https://filebin.net/e4khyfgzm33r7mg2/testing.txt?t=xp9tggvs"
if let url = NSURL(string: _onlineFileUrl) {
    do {
        let data = try String(contentsOf: url as URL)
        print("\(data)")
        
    }
}

var stringData: String = ""
getDataFromUser()

writeToFile(stringData: stringData)

readDataFromFile()

