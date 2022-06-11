//
//  MessagesViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 04/03/2022.
//

import UIKit
import InputBarAccessoryView



class MessagesViewController: InputBarViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            ReceiveTableViewCell.register(on: tableView)
            SendTableViewCell.register(on: tableView)
        }
    }
    
    lazy var autocompleteManager: AutocompleteManager = { [unowned self] in
        let manager = AutocompleteManager(for: self.inputBar.inputTextView)
        manager.maxSpaceCountDuringCompletion = 1
        return manager
    }()
    
    
    var data: [MessageDataSource] = MessageDataSource.data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.alpha = 0
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Messages"
        
        view.backgroundColor = .white
        inputBar.inputTextView.autocorrectionType = .no
        inputBar.inputTextView.autocapitalizationType = .none
        inputBar.inputTextView.keyboardType = .twitter
        let size = UIFont.preferredFont(forTextStyle: .body).pointSize
        autocompleteManager.register(prefix: "@", with: [.font: UIFont.preferredFont(forTextStyle: .body),.foregroundColor: UIColor.systemBlue,.backgroundColor: UIColor.systemBlue.withAlphaComponent(0.1)])
        autocompleteManager.register(prefix: "#", with: [.font: UIFont.boldSystemFont(ofSize: size)])
        inputBar.inputPlugins = [autocompleteManager]
        
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.tabBarController?.tabBar.isHidden = true

    }

    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if oneTime {
            reload()
        }
        oneTime = false
        self.navigationController?.tabBarController?.tabBar.isHidden = true

        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    var oneTime: Bool = true
    
    func reload() {
        
        tableView.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.tableView.reloadData()
        }
        let numberOfSections = self.tableView.numberOfSections
        let numberOfRows = self.tableView.numberOfRows(inSection: numberOfSections-1)
        
        let indexPath = IndexPath(row: numberOfRows-1 , section: numberOfSections-1)
        self.tableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.middle, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.tableView.alpha = 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data[indexPath.row].type {
        case .send:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SendTableViewCell") as! SendTableViewCell
            cell.titleLabel.text = data[indexPath.row].message
            return cell
            
        case .revice:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiveTableViewCell") as! ReceiveTableViewCell
            cell.titleLabel.text  = data[indexPath.row].message
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        print(text)
        self.data.append(MessageDataSource(message: text, type: .send))
        self.tableView.reloadData()
        setStateSending()
        DispatchQueue.global(qos: .background).async { [weak self] in
            sleep(1)
            DispatchQueue.main.async { [weak self] in
                self?.setStateReady()
            }
        }
    }
    
    private func setStateSending() {
        inputBar.inputTextView.text = ""
        inputBar.inputTextView.placeholder = "Sending..."
        inputBar.inputTextView.isEditable = false
        inputBar.sendButton.startAnimating()
    }
    
    private func setStateReady() {
        inputBar.inputTextView.text = ""
        inputBar.inputTextView.placeholder = "Aa"
        inputBar.inputTextView.isEditable = true
        inputBar.sendButton.stopAnimating()
    }
}
