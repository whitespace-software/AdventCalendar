//
//  NSDate.swift
//  AdventCalendar
//
//  Created by Jonathan Clarke on 11/12/2015.
//  Copyright © 2015 Jonathan Clarke. All rights reserved.
//

import Foundation

extension NSDate {
    func splitYMD() -> [Int] {
        let calendar = NSCalendar.currentCalendar()
        let c = calendar.components( [ NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year ], fromDate: self )
        return [ c.year, c.month, c.day ]
    }
}
