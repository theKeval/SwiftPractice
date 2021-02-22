//
//  LocalJsonFile.swift
//  ProductStock
//
//  Created by Bhavesh Sharma on 19/02/21.
//

import Foundation

class Product: Codable{
    let name:String
    let price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

class LocalJson{
    
    // converting object to string
    func getJsonString(of obj: [Product]) -> String{
        do{
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(obj)
            if let json = String(data: jsonData, encoding: String.Encoding.utf8){
                print(json)
                return json
            }
        }catch{ }
        return ""
    }
    
    func saveJsonFile(of data: String){
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                            in: .userDomainMask).first {
            let pathWithFilename = documentDirectory.appendingPathComponent("myJsonString.json")
            print(pathWithFilename) // this is thet path where our file will be stored
            do {
                try data.write(to: pathWithFilename, atomically: true, encoding: .utf8)
            } catch {
                // Handle error
            }
        }
        
    }
    
    func read() -> [Product] {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let url = documentDirectory.appendingPathComponent("myJsonString.json")
            let data = NSData(contentsOf: url)
            
            do {
                // converting data to object(i.e Product in our case)
                if let payload = data as Data?{
                    let product = try JSONDecoder().decode([Product].self, from: payload)
                    return product
                }
            } catch {  }
            
        }
        return []
    }
}


