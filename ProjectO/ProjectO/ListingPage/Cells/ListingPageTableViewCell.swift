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
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            HomeImageCollectionViewCell.register(on: collectionView)
        }
    }
    
    var didTapReplyClosure: (()-> Void)?
    var didTapFavClosure: (()-> Void)?
    var didTapImage: (()-> Void)?

    var images: [String] = []
    
    @IBOutlet weak var replyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentViewOutLet.layer.cornerRadius = 8
        collectionView.layer.cornerRadius = 8 
        favImage.tintColor = UIColor(red: 255 / 255, green: 55 / 255, blue: 28 / 255, alpha: 0.9)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func didTapReply(_ sender: Any) {
        didTapReplyClosure?()
    }
    
    @IBAction func didTapFav(_ sender: Any) {
        didTapFavClosure?()
    }
    
    func postSetup(obj: PostModel) {
        titleLbl.text = obj.title
        detailsLbl.text = obj.body
        viewLabel.text = (obj.views ?? "") + " Views"
        
        let df = DateFormatter()
        df.dateFormat = "MM/dd hh:mm"
        let now = df.string(from: obj.date ?? Date())
        dateLbl.text = now
    }
}

extension ListingPageTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeImageCollectionViewCell", for: indexPath) as! HomeImageCollectionViewCell
        cell.imageOutlet.image = convertBase64StringToImage(imageBase64String: images[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didTapImage?()
    }
}
