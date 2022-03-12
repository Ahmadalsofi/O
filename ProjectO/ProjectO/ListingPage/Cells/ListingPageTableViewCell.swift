//
//  ListingPageTableViewCell.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 25/02/2022.
//

import UIKit

class ListingPageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentViewOutLet: UIView!
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var favImage: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    
    var didTapReplyClosure: (()-> Void)?
    
    @IBOutlet weak var replyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentViewOutLet.layer.cornerRadius = 8
        favImage.tintColor = UIColor(red: 255 / 255, green: 55 / 255, blue: 28 / 255, alpha: 0.9)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func didTapReply(_ sender: Any) {
        didTapReplyClosure?()
    }
    
    
    func postSetup(obj: PostModel) {
        titleLbl.text = obj.title
        detailsLbl.text = obj.body
        viewLabel.text = obj.views! + " Views"
        
        let df = DateFormatter()
        df.dateFormat = "MM/dd hh:mm"
        let now = df.string(from: obj.date!)
        dateLbl.text = now
    }
}
