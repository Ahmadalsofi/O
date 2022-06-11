//
//  AddPostViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 04/03/2022.
//

import UIKit

var categories = ["A","B","C"]


protocol AddPostImages {
    func selectedImages(images: [String])
}

class AddPostViewController: BaseViewController {
    
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var imagesCollection: UICollectionView!
    @IBOutlet weak var uploadImageBtn: UIButton!
    @IBOutlet weak var postBtn: UIButton!
    @IBOutlet weak var bodyTxt: UITextField!
    @IBOutlet weak var desTxt: UITextView!
    
    @IBOutlet weak var ageViewHeight: NSLayoutConstraint!
    @IBOutlet weak var locationViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var showLocationSwitch: UISwitch!
    @IBOutlet weak var showAgeSwitc: UISwitch!
    
    var selectedCategory = ""
    var images: [String] = []
    
    var enableAge: Bool = false
    var isItPost: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackSetup()
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        selectedCategory = categories.first ?? ""
        
        
        self.title = insideAddPostTitle
        
        postBtn.layer.cornerRadius = 8
        
        imagesCollection.delegate = self
        imagesCollection.dataSource = self
        
        
        if isItPost {
            self.title =  insideAddPostTitle
        }else {
            self.title = insideAddQustionTitle
            self.ageViewHeight.constant = 0
            self.locationViewHeight.constant = 0
            self.showAgeSwitc.isHidden = true
            self.showLocationSwitch.isHidden = true 
            self.imagesCollection.isHidden = true
            self.uploadImageBtn.isHidden = true
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func didTapCategory(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        for i in categories {
            alert.addAction(UIAlertAction(title: i, style: .default , handler:{ (UIAlertAction)in
                self.categoryBtn.setTitle(i, for: .normal)
            }))
        }
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    @IBAction func didTapPost(_ sender: Any) {
        guard let title = bodyTxt.text, let body = desTxt.text else {return}
        let uuid = UUID().uuidString
        
        //        if toggleOutLet.selectedSegmentIndex == 0 {
        //            let post = PostModel(title: title, body: body, showAge: self.showAgeSwitc.isOn, permanent: self.permanentSwitch.isOn, category: self.selectedCategory, email: LoginManager.currentEmail(), id: uuid, date: Date(), views: "122", isFav: false, images: self.images)
        //            PostDefaultManager.createPost(post: post)
        //        }else {
        //            let post = PostModel(title: title, body: body, showAge: self.showAgeSwitc.isOn, permanent: self.permanentSwitch.isOn, category: self.selectedCategory, email: LoginManager.currentEmail(), id: uuid, date: Date(), views: "122", isFav: false, images: self.images)
        //            QustionDefaultManager.createPost(post: post)
        //        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapUploadImage(_ sender: Any) {
        self.performSegue(withIdentifier: "PhotosViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PhotosViewController" {
            let view = segue.destination as! PhotosViewController
            view.fromAddPost = true
            view.delegate = self
        }
    }
}

extension AddPostViewController: AddPostImages {
    func selectedImages(images: [String]) {
        self.images = images
        self.imagesCollection.reloadData()
    }
}

extension AddPostViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddPostImageCollectionViewCell", for: indexPath) as! AddPostImageCollectionViewCell
        cell.imageOutlet.image = convertBase64StringToImage(imageBase64String: images[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 70)
    }
}

extension AddPostViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = categories[row]
    }
}
