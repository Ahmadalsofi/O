//
//  PostDetailsViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/06/2022.
//

import UIKit

class PostDetailsViewController: BaseViewController {

    
    @IBOutlet weak var detailsTxt: UITextView!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            HomeImageCollectionViewCell.register(on: collectionView)
        }
    }
    
  
    
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    var postModel: PostModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackSetup()
        self.title = "Post Details"
        // Do any additional setup after loading the view.
        titleLb.text = postModel?.title ?? ""
        
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        
        self.detailsTxt.text = postModel?.body ?? ""
        
        collectionView.layer.cornerRadius = 8
        collectionView.delegate = self
        collectionView.dataSource = self
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.tabBarController?.tabBar.isHidden = false
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    @IBAction func didTapReply(_ sender: Any) {
        let vc = UIStoryboard.init(name: "InboxSB", bundle: Bundle.main).instantiateViewController(withIdentifier: "MessagesViewController") as? MessagesViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension PostDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("___")
        print(postModel?.images.count ?? 0)
        return postModel?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeImageCollectionViewCell", for: indexPath) as! HomeImageCollectionViewCell
        cell.imageOutlet.image = convertBase64StringToImage(imageBase64String: (postModel?.images[indexPath.row])!)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Slide", sender: indexPath.row)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Slide" {
            let index = sender as! Int
            let vc = segue.destination as! ImagesSlideViewController
            vc.modalPresentationStyle = .fullScreen
            vc.images = postModel?.images ?? []
        }
    }
}
