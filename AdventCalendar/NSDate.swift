//
//  NSDate.swift
//  AdventCalendar
//
//  Created by Jonathan Clarke on 11/12/2015.
//  Copyright © 2015 Jonathan Clarke. All rights reserved.
//

import Foundation

typealias ymd = ( y : Int, m : Int, d : Int )

extension NSDate {
    func splitYMD() -> ymd {
        let calendar = NSCalendar.currentCalendar()
        let c = calendar.components( [ NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year ], fromDate: self )
        return ymd( y: c.year, m: c.month, d: c.day )
    }
}
