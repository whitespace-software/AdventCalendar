//
//  CalLayout.swift
//  AdventCalendar
//
//  Created by Jonathan Clarke on 11/12/2015.
//  Copyright © 2015 Jonathan Clarke. All rights reserved.
//

import UIKit

// http://www.raywenderlich.com/107439/uicollectionview-custom-layout-tutorial-pinterest
// http://www.raywenderlich.com/107687/uicollectionview-custom-layout-tutorial-spinning-wheel
// http://blog.donnywals.com/creating-a-custom-uicollectionviewlayout-in-swift/


class CalLayout: UICollectionViewLayout {
    let itemSize: CGFloat = 50
    let gap: CGFloat = 2
    var layoutInfo: [NSIndexPath:UICollectionViewLayoutAttributes] = [NSIndexPath:UICollectionViewLayoutAttributes]()
    var fHeight : CGFloat = 0
    var fWidth : CGFloat = 0
    var rowCount : CGFloat = 7
    var colCount : CGFloat = 6
    
    override func prepareLayout() {
        if let cv = self.collectionView {
            fHeight = cv.frame.height // incorrect - top lopped off
            fWidth = cv.frame.width
            print( "fWidth,fHeight", fWidth, fHeight )
        }
        layoutInfo = [NSIndexPath:UICollectionViewLayoutAttributes]()
        for var i = 0; i < self.collectionView?.numberOfItemsInSection(0); i++ {
            let indexPath = NSIndexPath(forRow: i, inSection: 0)
            let itemAttributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            itemAttributes.frame = frameForItemAtIndexPath(indexPath)
            layoutInfo[indexPath] = itemAttributes
        }
    }

    
    func frameForItemAtIndexPath(indexPath: NSIndexPath) -> CGRect {
        
        let day = indexPath.row + 1
        let cols = Int(colCount)
        let rows = Int(rowCount)
        
        if( day <= 6 ) {
            return calcRect( 0, day - 1 )
        }
        if day <= 12 {
            return calcRect( day - 6, cols - 1 )
        }
        if day <= 17 {
            return calcRect( rows - 1, 17 - day )
        }
        if day <= 22 {
            return calcRect( 23 - day, 0 )
        }
        if day == 23 {
            return calcRect( 1, 1 )
        }
        if day == 24 {
            return calcRect( 1, cols - 2 )
        }
        return calcRect( 2, 1, day )
    }
    
    func calcRect( r : Int, _ c : Int, _ day : Int = 0 ) -> CGRect
    {
        var xPos = CGFloat(c) * ( itemSize + gap )
        var yPos = CGFloat(r) * ( itemSize + gap )
        
        let xMargin = fWidth - ( itemSize * colCount + gap * ( colCount - 1 ) )
        if xMargin > 0 {
            xPos += xMargin / 2
            if fHeight > fWidth {
                yPos += xMargin / 2
            } else {
                yPos += gap
            }
        }
        if day == 25 {
            let bigSize = itemSize * 4 + ( gap * 3 )
            return CGRectMake(xPos, yPos, bigSize, bigSize)
        }
        else {
            return CGRectMake(xPos, yPos, itemSize, itemSize)
        }
    }
    
    override func collectionViewContentSize() -> CGSize {
        if let cv = collectionView {
            return cv.frame.size
        }
        return CGSizeMake(0,0)
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var allAttributes: [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
        
        for (_, attributes) in layoutInfo {
            if CGRectIntersectsRect(rect, attributes.frame) {
                allAttributes.append(attributes)
            }
        }
        
        return allAttributes
    }
}
