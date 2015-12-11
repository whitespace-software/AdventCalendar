//
//  CalendarCVC.swift
//  AdventCalendar
//
//  Created by Jonathan Clarke on 10/12/2015.
//  Copyright © 2015 Jonathan Clarke. All rights reserved.
//

import UIKit

// private let reuseIdentifier = "CalendarCell"

class CalendarCVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.backgroundColor = UIColor.whiteColor()
        self.title = "Advent Calendar"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CalendarCell.getReuseIdentifier(), forIndexPath: indexPath)
        
        if let ccell = cell as? CalendarCell {
            let dayno = indexPath.row + 1
            ccell.setText( dayno.description )
        }
        return cell
    }
}
