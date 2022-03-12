//
//  PhotosViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 12/03/2022.
//

import UIKit

class PhotosViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            PhotoCollectionViewCell.register(on: collectionView)
        }
    }
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        //   imageView.image = image
    }
    @IBAction func didTapClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        if indexPath.row == 0 {
            cell.itemImage.image = UIImage(named: "1")
        }
        if indexPath.row == 1 {
            cell.itemImage.image = UIImage(named: "2")
            
        }
        if indexPath.row == 2 {
            cell.itemImage.image = UIImage(named: "3")
            
        }
        if indexPath.row == 3 {
            cell.itemImage.image = UIImage(named: "4")
            
        }
        if indexPath.row == 4 {
            cell.itemImage.image = UIImage(named: "1")
            
        }
        if indexPath.row == 5 {
            cell.itemImage.image = UIImage(named: "2")
            
        }
        if indexPath.row == 6 {
            cell.itemImage.image = UIImage(named: "3")
            
        }
        if indexPath.row == 7 {
            cell.itemImage.image = UIImage(named: "4")
            
        }
        if indexPath.row == 8 {
            cell.itemImage.image = UIImage(named: "1")
            
        }
        if indexPath.row == 9 {
            cell.itemImage.image = UIImage(named: "2")
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width / 2 - 20, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.alert(text: "Are you sure you want to delete this photo?", textField: UITextField())
    }
    
}
