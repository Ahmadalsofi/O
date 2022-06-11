//
//  HomeImageCollectionViewCell.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 21/05/2022.
//

import UIKit

class HomeImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageOutlet: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageOutlet.layer.masksToBounds = true
        imageOutlet.layer.cornerRadius = 8
    }

}
