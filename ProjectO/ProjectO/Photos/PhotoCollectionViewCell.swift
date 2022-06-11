//
//  PhotoCollectionViewCell.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 12/03/2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var itemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectedView.layer.cornerRadius = 6
        // Initialization code
    }

}
