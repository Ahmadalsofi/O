//
//  ReceiveTableViewCell.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 04/03/2022.
//

import UIKit

class ReceiveTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentViewOutLet: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.contentViewOutLet.roundCorners(corners: [.topLeft,.topRight,.bottomLeft], radius: 8)
        }
    }
    
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
