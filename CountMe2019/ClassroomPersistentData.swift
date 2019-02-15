//
//  ClassroomPersistentData.swift
//  CountMe2019
//
//  Created by Uma Parhar on 2/14/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import os.log

// **** Replace "PersistentData" with the name of your class object to be persistent ***
class ClassroomPersistentData: Codable {
    // **** These are all the Properties of the object to be persistent. ****
    // **** Every Property must be "Codable".                            ****
    var classPeriod: Int
    var className: String
    var classList = [Student]()
    
    // **** The initializer ("constructor" in Java terms) gives the persistent object its initial values ****
    // **** before it is restored from an archived value. Every Property must have an initial value. ****
    init() {
        classPeriod = 0
        className = ""
        classList = [Student]()
    }
    
    // ********** You should not have to change ANYTHING in "func archive()" to use *************
    /**
     * Archive this PersistentData object
     * @param: fileName from which to archived this object
     */
    func archive(fileName: String) {
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        do {
            let encodedData = try PropertyListEncoder().encode(self)
            let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(encodedData, toFile: archiveURL.path)
            if isSuccessfulSave {
                os_log("Data successfully saved to file.", log: OSLog.default, type: .debug)
            } else {
                os_log("Failed to save data...", log: OSLog.default, type: .error)
            }
        } catch {
            os_log("Failed to save data...", log: OSLog.default, type: .error)
        }
    }
    
    // ********** Replace "PersistentData" in this function with your class's name *************
    // ********** Restore the recovered values into object's current values *************
    /**
     * Recover the previously archived PersistentData object
     * @param: fileName from which to recover the previously archived file
     */
    func restore(fileName: String) {
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        if let recoveredDataCoded = NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? Data {
            do {
                // *** Replace "PersistentData" on the next line with the name of the class to be persistent. ***
                let recoveredData = try PropertyListDecoder().decode(ClassroomPersistentData.self, from: recoveredDataCoded)
                os_log("Data successfully recovered from file.", log: OSLog.default, type: .debug)
                // *** Replace all the assignment statements BELOW to "restore" all properties of the object ***
                classPeriod = recoveredData.classPeriod
                className = recoveredData.className
                classList = recoveredData.classList
                // *** Replace all the assignment statements ABOVE to "restore" all properties of the object ***
            } catch {
                os_log("Failed to recover data", log: OSLog.default, type: .error)
            }
        } else {
            os_log("Failed to recover data", log: OSLog.default, type: .error)
        }
    }
    
}
