//
//  FavouriteViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 25/02/2022.
//

import UIKit

class FavouriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewOutlet: UITableView! {
        didSet {
            ListingPageTableViewCell.register(on: tableViewOutlet)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        self.title = "Favorite"
        self.tabBarItem.title = "Favorite"
        self.tabBarItem.image = UIImage(systemName: "star")
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingPageTableViewCell") as! ListingPageTableViewCell
        cell.favImage.image = UIImage(systemName: "star.fill")
        
        cell.didTapReplyClosure = {
            self.performSegue(withIdentifier: "reply", sender: indexPath.row)
        }
        cell.didTapFavClosure = {
            FavDefaultManager.remove(post: FavModel(postID: self.getData()[indexPath.row].id, email: LoginManager.currentEmail()))
            self.tableViewOutlet.reloadData()
        }
        cell.postSetup(obj: getData()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func getData() -> [PostModel] {
       let post =  PostDefaultManager.retrivePosts()
       let fav =  FavDefaultManager.retrive()
        var new = [PostModel]()
        for i in post {
            if fav.contains(where: { $0.postID == i.id }) {
                new.append(i)
            }
        }
        return new
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "ReplySB", bundle: Bundle.main).instantiateInitialViewController() as? ReplyViewController
        vc?.postModel = self.getData()[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "reply" {
//            let index = sender as! Int
//            let vc = segue.destination as! ReplyViewController
//            vc.postModel =
//        }
//    }
}
