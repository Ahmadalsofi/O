//
//  ListingPageViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 25/02/2022.
//

import UIKit

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
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            ListingPageTableViewCell.register(on: tableView)
        }
    }
    
    var isQustionSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tabBarItem.title = "Home"
        self.tabBarItem.image = UIImage(systemName: "house")
        
        if #available(iOS 13.0, *) {
            let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
            segmentOutlet.setTitleTextAttributes(titleTextAttributes, for:.normal)

            let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor.white]
            segmentOutlet.setTitleTextAttributes(titleTextAttributes1, for:.selected)
        }
    }
    
    @IBAction func didTapAddPost(_ sender: Any) {
        self.performSegue(withIdentifier: "AddPostViewController", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentOutlet.selectedSegmentIndex == 0 {
            return postModelDataSource().count
        }
        return qAndAModelDataSource().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingPageTableViewCell") as! ListingPageTableViewCell
        cell.favImage.image = UIImage(systemName: "star")
        
        if segmentOutlet.selectedSegmentIndex == 0 {
            cell.replyLbl.text = "Comment"
            cell.postSetup(obj: postModelDataSource()[indexPath.row])
        }else {
            cell.postSetup(obj: qAndAModelDataSource()[indexPath.row])
            cell.replyLbl.text = "Reply"
        }
        
        cell.didTapReplyClosure = {
            self.routeToReply()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.height / 3
    }
    @IBAction func didTapSeg(_ sender: Any) {
        if self.segmentOutlet.selectedSegmentIndex == 0 {
            isQustionSelected = false
            self.tableView.reloadData()
        }else {
            isQustionSelected = true
            self.tableView.reloadData()
        }
    }
    
    func routeToReply() {
        if segmentOutlet.selectedSegmentIndex == 0 {
            self.performSegue(withIdentifier: "reply", sender: nil)
        }else {
            self.performSegue(withIdentifier: "MessagesViewController", sender: nil)
        }
    }
}
