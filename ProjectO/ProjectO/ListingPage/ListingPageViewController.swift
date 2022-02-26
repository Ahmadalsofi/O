//
//  ListingPageViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 25/02/2022.
//

import UIKit

//post sort by date
// q and a sort by view
// post reply inbox
// q and a reply on the q

// setting
// post


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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingPageTableViewCell") as! ListingPageTableViewCell
        cell.favImage.image = UIImage(systemName: "star")
        if isQustionSelected {
            cell.backgroundColor = .lightGray
        } else {
            cell.backgroundColor = .clear
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
}
