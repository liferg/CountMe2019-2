//
//  Classroom.swift
//  CountMe2019
//
//  Created by Uma Parhar on 1/3/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import os.log
class Classroom: NSObject, Codable {
    var classPeriod: Int
    var className: String
    var classList = [Student]()
    init(_ period: Int, _ cN: String)
    {
        self.classPeriod = period
        self.className = cN
    }
    func addStudent(_ stud: Student) {
        classList.append(stud)
    }
    /**
     Archive this PersistentData object's values.
     
     The "archive" function saves the properties of the object to a particular
     file name indicated. Using different file names allows different variants of
     the object to be saved and selectively reloaded later. For example: the file
     name may include a date or time which allows the user to choose a specific
     object's property values to be reloaded.
     
     - Attention:
     You do not have to change ANYTHING in "func archive()" to use for your object.
     
     - Author:
     George K Behnke
     
     - Parameters:
     - fileName: The file name to archive this object to.
     
     - Version: 1.1
     
     */
    func archive(fileName: String) {
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        do {
            let encodedPersistentData = try PropertyListEncoder().encode(self)
            let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(encodedPersistentData, toFile: archiveURL.path)
            if isSuccessfulSave {
                os_log("PersistentData successfully saved to file.", log: OSLog.default, type: .debug)
            } else {
                os_log("Failed to save PersistentData...", log: OSLog.default, type: .error)
            }
        } catch {
            os_log("Failed to save PersistentData...", log: OSLog.default, type: .error)
        }
    }
    
    /**
     Recover the previously archived PersistentData object's values.
     
     The "restore" function attempts to read previously saved values from the indicated
     file. If the file name is found, those values are restored to the object. If the
     file is not found, the values from the initializer are set to the object's properties.
     
     - Attention:
     * Replace "PersistentData" within this function with your class's name.
     * Restore the recovered values into object's current values.
     
     - Author:
     George K Behnke
     
     - Parameters:
     - fileName: The filename from which to recover the previously archived object.
     
     - Version: 1.1
     
     */
    func restore(fileName: String) {
        let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent(fileName)
        if let recoveredDataCoded = NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? Data {
            do {
                // *** 4. Replace "PersistentData" on the next line with the name of the class to be persistent. ***
                let recoveredData = try PropertyListDecoder().decode(Classroom.self, from: recoveredDataCoded)
                os_log("PersistentData successfully recovered from file.", log: OSLog.default, type: .debug)
                // *** 5. Replace all the assignment statements BELOW to "restore" all properties of the object ***
                classPeriod = recoveredData.classPeriod
                className = recoveredData.className
                classList = recoveredData.classList
                // *** 5. Replace all the assignment statements ABOVE to "restore" all properties of the object ***
            } catch {
                os_log("Failed to recover PersistentData", log: OSLog.default, type: .error)
            }
        } else {
            os_log("Failed to recover PersistentData", log: OSLog.default, type: .error)
        }
    }

}
