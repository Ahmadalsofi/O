//
//  ReplyHeaderTableViewCell.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/03/2022.
//

import UIKit

class ReplyHeaderTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var contentViewOutLet: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    var didTapReplyClosure: (()-> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentViewOutLet.layer.cornerRadius = 8
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
 
    func postSetup(obj: PostModel) {
        titleLbl.text = obj.title
        detailsLbl.text = obj.body
        
        let df = DateFormatter()
        df.dateFormat = "MM/dd hh:mm"
        let now = df.string(from: obj.date!)
        dateLbl.text = now
    }
}
