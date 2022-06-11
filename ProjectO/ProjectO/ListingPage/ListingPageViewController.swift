//
//  ListingPageViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 25/02/2022.
//

import UIKit


// reply for post
// comment for q and a
// reply page title should be the title of post




// post sort by date
// q and a sort by view
// post reply inbox
// q and a comment instead of reply on the q



/// add post
/// show age only for post
/// add picture,
/// boom 5 second
/// boom , permanent  for post
/// permanent  for question

/// Home post
// remove image from post and Q & A


/// inbox
// list, head line
// remove image
// chat card
// photo boom , permanen
// from gallery or from profile


/// setting
// logout
// nick name
// photo
// password
// phone
// permission location and country




class ListingPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
    @IBOutlet weak var sortBtn: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            ListingPageTableViewCell.register(on: tableView)
        }
    }
    
    var isQustionSelected = false
    
    var selectedCategory  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        segmentOutlet.setTitle(homePost, forSegmentAt: 0)
        segmentOutlet.setTitle(homeQAndA, forSegmentAt: 1)

        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        self.title = homeTitle
        self.tabBarItem.title = homeTab
        self.tabBarItem.image = UIImage(systemName: "house")
        
        if #available(iOS 13.0, *) {
            let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
            segmentOutlet.setTitleTextAttributes(titleTextAttributes, for:.normal)
            
            let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
            segmentOutlet.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentOutlet.selectedSegmentIndex == 0 {
            return postData().count
        }
        return QustionDefaultManager.retriveQustionModel().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingPageTableViewCell") as! ListingPageTableViewCell
        cell.favImage.image = UIImage(systemName: "star")
        
        if segmentOutlet.selectedSegmentIndex == 0 {
            cell.replyLbl.text = "Reply"
            cell.postSetup(obj: postData()[indexPath.row])
            cell.images = postData()[indexPath.row].images ?? []
            cell.collectionView.reloadData()
            //  cell.collectionView.isHidden = false
        }else {
            cell.replyLbl.text = "Comment"
            cell.postSetup(obj: QustionDefaultManager.retriveQustionModel()[indexPath.row])
            //   cell.collectionView.isHidden = true
        }
        
        cell.didTapReplyClosure = {
            self.routeToReply(index: indexPath.row)
        }
        
        cell.didTapFavClosure = {
            FavDefaultManager.create(post:FavModel(postID: self.postData()[indexPath.row].id, email: LoginManager.currentEmail()))
        }
        
        cell.didTapImage = {
            self.performSegue(withIdentifier: "Slide", sender: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    @IBAction func didTapSeg(_ sender: Any) {
        if self.segmentOutlet.selectedSegmentIndex == 0 {
            isQustionSelected = false
            self.sortBtn.isHidden = false
            self.tableView.reloadData()
        }else {
            self.sortBtn.isHidden = true
            isQustionSelected = true
            self.tableView.reloadData()
        }
    }
    
    func postData() -> [PostModel]  {
        if selectedCategory.isEmpty {
            return PostDefaultManager.retrivePosts()
        }else {
            let data = PostDefaultManager.retrivePosts()
            return data.filter({ $0.category == selectedCategory })
        }
    }
    
    @IBAction func didTapSort(_ sender: Any) {
        let alert = UIAlertController(title: "Categories", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "All", style: .default , handler:{ (UIAlertAction) in
            self.selectedCategory = ""
            self.tableView.reloadData()
        }))
        
        for i in categories {
            alert.addAction(UIAlertAction(title: i, style: .default , handler:{ (UIAlertAction) in
                self.selectedCategory = i
                self.sortBtn.setTitle("Sorted By (\(i))", for: .normal)
                self.tableView.reloadData()
            }))
        }
        
        let ac = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(ac)
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    func routeToReply(index: Int) {
        if segmentOutlet.selectedSegmentIndex == 0 {
            self.performSegue(withIdentifier: "MessagesViewController", sender: nil)
        }else {
            self.performSegue(withIdentifier: "reply", sender: index)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "reply" {
            let index = sender as! Int
            let vc = segue.destination as! ReplyViewController
            vc.postModel = self.postData()[index]
        }
        
        if segue.identifier == "Slide" {
            let index = sender as! Int
            let vc = segue.destination as! ImagesSlideViewController
            vc.modalPresentationStyle = .fullScreen
            vc.images = self.postData()[index].images
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //PostDetailsViewController
        if segmentOutlet.selectedSegmentIndex == 0 {
            let vc = UIStoryboard.init(name: "PostDetailsSB", bundle: Bundle.main).instantiateViewController(withIdentifier: "PostDetailsViewController") as? PostDetailsViewController
            vc?.postModel = self.postData()[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
        }else {
            
            let vc = UIStoryboard.init(name: "ReplySB", bundle: Bundle.main).instantiateInitialViewController() as? ReplyViewController
            vc?.postModel = self.postData()[indexPath.row]
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}
