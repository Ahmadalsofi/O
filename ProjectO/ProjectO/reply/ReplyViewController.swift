//
//  ReplyViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/03/2022.
//

import UIKit

class ReplyViewController: BaseViewController,  UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            ReplyHeaderTableViewCell.register(on: tableView)
            ReplyTableViewCell.register(on: tableView)
        }
    }
    @IBOutlet weak var textTxt: UITextField!
    
    var postModel: PostModel?
    let customView = CommentInputView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBackSetup()
        self.title = commentTitle
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        
        customView.frame = CGRect(x: 0, y: 0, width: 10, height: 55)
        textTxt.inputAccessoryView = customView
        textTxt.delegate = self
        textTxt.addTarget(self, action: #selector(yourHandler(textField:)), for: .editingChanged)

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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField.text?.isEmpty ?? true) {return true }
        CommentDefaultManager.create(post: CommentModel(postID: self.postModel?.id, text: textField.text!, date: Date()))
        self.textTxt.text = ""
        self.textTxt.resignFirstResponder()
        self.tableView.reloadData()
        return true
    }
    
    @objc final private func yourHandler(textField: UITextField) {
        customView.textOutlet.text = textField.text
    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        textTxt.becomeFirstResponder()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return replyData().count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyHeaderTableViewCell") as! ReplyHeaderTableViewCell
            cell.postSetup(obj: postModel!)
            return cell
        }
        
//        if indexPath.row == 1 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyImagesUITableViewCell") as! ReplyImagesUITableViewCell
//            cell.images = self.postModel?.images ?? []
//            cell.collectionView.reloadData()
//            return cell
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReplyTableViewCell") as! ReplyTableViewCell
        cell.postSetup(obj: replyData()[indexPath.row - 1])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func replyData() -> [CommentModel] {
        let data = CommentDefaultManager.retrive()
        let id = self.postModel?.id ?? ""
        return data.filter( { $0.postID == id } )
    }
}
