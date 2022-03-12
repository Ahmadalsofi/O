//
//  ReplyViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/03/2022.
//

import UIKit

class ReplyViewController: BaseViewController,  UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            ReplyHeaderTableViewCell.register(on: tableView)
            ReplyTableViewCell.register(on: tableView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackSetup()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func didTapClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return replyModelDataSource().count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyHeaderTableViewCell") as! ReplyHeaderTableViewCell
            cell.postSetup(obj: postModelDataSource()[0])
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyTableViewCell") as! ReplyTableViewCell
        cell.postSetup(obj: replyModelDataSource()[indexPath.row - 1])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
