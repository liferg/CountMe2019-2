//
//  PersistentData.swift
//  CountMe2019
//
//  Created by Uma Parhar on 2/13/19.
//  Copyright © 2019 District196.org. All rights reserved.
//

import Foundation
import os.log

class PersistentData: Codable {
    var firstName: String
    var lastName: String
    var count: Int
    var studentParticipation = [String: Int]()
    
    init() {
        firstName = ""
        lastName = ""
        count = 0
        studentParticipation = ["": 0]
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
                let recoveredData = try PropertyListDecoder().decode(PersistentData.self, from: recoveredDataCoded)
                os_log("Data successfully recovered from file.", log: OSLog.default, type: .debug)
                // *** Replace all the assignment statements BELOW to "restore" all properties of the object ***
                firstName = recoveredData.firstName
                lastName = recoveredData.lastName
                count = recoveredData.count
                studentParticipation = recoveredData.studentParticipation
                // *** Replace all the assignment statements ABOVE to "restore" all properties of the object ***
            } catch {
                os_log("Failed to recover data", log: OSLog.default, type: .error)
            }
        } else {
            os_log("Failed to recover data", log: OSLog.default, type: .error)
        }
    }
    
}

