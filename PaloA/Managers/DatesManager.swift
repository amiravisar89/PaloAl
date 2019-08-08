//
//  DatesManager.swift
//  PaloA
//
//  Created by Amir Avisar on 08/08/2019.
//  Copyright © 2019 Amir Avisar. All rights reserved.
//

import UIKit

class DatesManager: NSObject {
    
    /*
     isDateInPast.
     Checking if date is in the past to check if release or coming soon
     - Parameters:
        - stringDate: date in string format
     */
    static func isDateInPast(stringDate : String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from:stringDate)!
        if date > Date() {
            return false
        } else {
            return true
        }
    }
}
