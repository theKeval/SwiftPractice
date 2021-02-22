//
//  CommaSeparated.swift
//  file_io_practice
//
//  Created by Keval on 2/22/21.
//

import Foundation

class CommaSeparated {
    
    
    /// This function will first check if directory already exist or not,
    /// If it exist, it'll return the url or if don't exist, it'll create the directory and then return it's url
    func createDirectoryIfDontExist(dirName: String) {
        
        let docuPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let docuUrl = URL(string: docuPath)!
        let myDirUrl = docuUrl.appendingPathComponent("MyInventory")
        if !FileManager.default.fileExists(atPath: myDirUrl.absoluteString) {
            do {
                try FileManager.default.createDirectory(atPath: myDirUrl.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // function to start executing
    func main() {
        let myBankUrl = URL.createDirectory(dirName: "MyBank")
    }
    
}

extension URL {
    
    /// create directory if don't exist
    static func createDirectory(dirName: String) -> URL? {
        let fileManager = FileManager.default
        
        // Get document directory for device, this should succeed
        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            // Construct a URL with desired folder name
            let directoryUrl = documentDirectory.appendingPathComponent(dirName)
            
            // If folder URL does not exist, create it
            if !fileManager.fileExists(atPath: directoryUrl.absoluteString) {
                do {
                    // Attempt to create folder
                    try fileManager.createDirectory(atPath: directoryUrl.path, withIntermediateDirectories: true, attributes: nil)
                    
                } catch {
                    // Creation failed. Print error & return nil
                    print(error.localizedDescription)
                    return nil
                }
            }
            
            // Folder either exists, or was created. Return URL
            return directoryUrl
        }
        
        // Will only be called if document directory not found
        return nil
        
    }
    
}
