//
//  CalendarCell.swift
//  AdventCalendar
//
//  Created by Jonathan Clarke on 10/12/2015.
//  Copyright © 2015 Jonathan Clarke. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    static func getReuseIdentifier() -> String {
        return "CalendarCell"
    }
    func setText( str : String )
    {
        label.text = str
    }
    @IBOutlet weak var label: UILabel!
}


