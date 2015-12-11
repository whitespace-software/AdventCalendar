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

    var dayToday : Int = 0
    var clickedToday = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.backgroundColor = UIColor.whiteColor()
        self.title = "Swift Advent Calendar"
        
        setDayToday()
        let btn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Reply, target: self, action: "clickCheat")
        navigationItem.rightBarButtonItem = btn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func clickCheat()
    {
        if dayToday == 100 {
            setDayToday()
        } else {
            dayToday = 100
        }
        collectionView?.reloadData()
    }

    func setDayToday()
    {
        var dmy = NSDate().splitYMD()
        dayToday = dmy[2]

    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let dayno = indexPath.row + 1
        if dayno > dayToday || ( dayno == dayToday && !clickedToday ) {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CalendarCell.getReuseIdentifier(), forIndexPath: indexPath) as! CalendarCell
            cell.setText( dayno.description )
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(PictureCell.getReuseIdentifier(), forIndexPath: indexPath) as! PictureCell
            cell.setImagePng( "Advent\(dayno)" )
            return cell
        }
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row + 1 == dayToday {
            clickedToday = !clickedToday
            collectionView.reloadData()
        }
    }
    
    func collectionView(collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize
    {
        if indexPath.row + 1 == 25 {
            return CGSizeMake(200.0, 200.0)
        } else {
            return CGSizeMake(50, 50)
        }
    }
}
