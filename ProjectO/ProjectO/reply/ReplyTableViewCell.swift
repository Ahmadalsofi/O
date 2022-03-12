//
//  ReplyTableViewCell.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/03/2022.
//

import UIKit

class ReplyTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func postSetup(obj: ReplyModel) {
        bodyLbl.text = obj.body
        
        let df = DateFormatter()
        df.dateFormat = "MM/dd hh:mm"
        let now = df.string(from: obj.date!)
        dateLbl.text = now
    }
}
