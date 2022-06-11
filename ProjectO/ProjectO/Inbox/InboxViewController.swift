//
//  InboxViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 25/02/2022.
//

import UIKit

class InboxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView! {
        didSet {
            InboxTableViewCell.register(on: tableViewOutlet)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = inboxTitle
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        self.tabBarItem.title = inboxTab
        
        self.tabBarItem.image = UIImage(systemName: "tray")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InboxTableViewCell") as! InboxTableViewCell
        if indexPath.row == 0 {
            cell.imageOutlet.backgroundColor = UIColor(red: 255 / 255, green: 55 / 255, blue: 28 / 255, alpha: 0.9)
        }
        if indexPath.row == 1 {
            cell.imageOutlet.backgroundColor = UIColor(red: 100 / 255, green: 55 / 255, blue: 28 / 255, alpha: 0.9)
        }
        if indexPath.row == 2 {
            cell.imageOutlet.backgroundColor = UIColor(red: 170 / 255, green: 55 / 255, blue: 28 / 255, alpha: 0.9)
        }
        if indexPath.row == 3 {
            cell.imageOutlet.backgroundColor = UIColor(red: 230 / 255, green: 20 / 255, blue: 28 / 255, alpha: 0.9)
        }
        if indexPath.row == 4 {
            cell.imageOutlet.backgroundColor = UIColor(red: 80 / 255, green: 55 / 255, blue: 28 / 255, alpha: 0.9)
        }
        if indexPath.row == 5 {
            cell.imageOutlet.backgroundColor = UIColor(red: 120 / 255, green: 43 / 255, blue: 28 / 255, alpha: 0.9)
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "InboxSB", bundle: Bundle.main).instantiateViewController(withIdentifier: "MessagesViewController") as? MessagesViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
