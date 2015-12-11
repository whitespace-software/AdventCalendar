//
//  PictureCell.swift
//  AdventCalendar
//
//  Created by Jonathan Clarke on 11/12/2015.
//  Copyright © 2015 Jonathan Clarke. All rights reserved.
//

import UIKit

class PictureCell: UICollectionViewCell {
    static func getReuseIdentifier() -> String {
        return "PictureCell"
    }
    @IBOutlet weak var image: UIImageView!
    
    func setImagePng( pngname : String )
    {
        image.contentMode = .TopLeft
        image.image = UIImage(named: pngname)
    }
}
