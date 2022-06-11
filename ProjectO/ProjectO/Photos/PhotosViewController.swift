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
    
    @IBOutlet weak var doneBtn: UIButton!
    
    var fromAddPost: Bool = false
    var delegate: AddPostViewController?
    
    var selectedImageIndex: [IndexPath] = []
    var selectedImageData: [Data] = []
    
    var images: [ImagesModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Photos"
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if fromAddPost {
            self.doneBtn.isHidden = false
        }else {
            self.doneBtn.isHidden = true
        }
       
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.navigationController?.tabBarController?.tabBar.isHidden = true
            self.navigationController?.navigationItem.largeTitleDisplayMode = .never
            self.navigationController?.navigationBar.prefersLargeTitles = false
            self.reload()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = false
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func reload() {
        images = ImagesDefaultManager.retrive()
        self.collectionView.reloadData()
    }
    
    @IBAction func didTapDone(_ sender: Any) {
        var imagess: [String] = []
        for i in (0 ..< self.images.count) {
            if selectedImageIndex.contains(where: { $0 == IndexPath(row: i, section: 0) }) {
                imagess.append(self.images[i].image ?? "")
            }
        }
        print(imagess.count)
        delegate?.selectedImages(images: imagess)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        //   imageView.image = image
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        let convert = convertImageToBase64String(img: image!)
        ImagesDefaultManager.create(post: ImagesModel(image: convert))
        self.reload()
        self.dismiss(animated: true)
    }
    @IBAction func didTapClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.itemImage.image = convertBase64StringToImage(imageBase64String: images[indexPath.row].image!)
        cell.itemImage.contentMode = .scaleAspectFill
        
        if selectedImageIndex.contains(indexPath) {
            cell.selectedView.isHidden = false
        }else {
            cell.selectedView.isHidden = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width / 3 , height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if fromAddPost {
            if selectedImageIndex.contains(indexPath) {
                self.selectedImageIndex.removeAll(where: { $0 == indexPath })
            }else {
                self.selectedImageIndex.append(indexPath)
            }
            collectionView.reloadItems(at: [indexPath])
            return
        }
        self.alert(text: "Are you sure you want to delete this photo?", textField: UITextField())
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

func convertImageToBase64String (img: UIImage) -> String {
    let imageData:NSData = img.jpegData(compressionQuality: 0.50)! as NSData //UIImagePNGRepresentation(img)
    let imgString = imageData.base64EncodedString(options: .init(rawValue: 0))
    return imgString
}
func convertBase64StringToImage (imageBase64String:String) -> UIImage {
    let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
    let image = UIImage(data: imageData!)!
    return image
}
