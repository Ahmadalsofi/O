//
//  SendTableViewCell.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 04/03/2022.
//

import UIKit

class SendTableViewCell: UITableViewCell {

    @IBOutlet weak var contentViewOutLet: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.contentViewOutLet.roundCorners(corners: [.topLeft,.topRight,.bottomRight], radius: 8)
        }
    }
}
