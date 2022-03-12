//
//  File.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 25/02/2022.

import UIKit
class BaseViewController: UIViewController {
    
    convenience init() {
        self.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var backButton:UIButton {
        let button = UIButton(frame: CGRect(x: -10, y: 0, width: 40, height: 40))
        button.imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -20, bottom: 0, right: 0)
        let image = UIImage(systemName: "arrow.backward")
        
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.black
        button.addTarget(self, action: #selector(popBack), for: .touchUpInside)
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initBackSetup () {
        self.navigationController?.navigationBar.isTranslucent = true
        let backBarButton = UIBarButtonItem(customView: backButton)
        backBarButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backBarButton
    }
    
    func alert(text: String,textField: UITextField) {
        let alert = UIAlertController(title: text, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _  in
            textField.becomeFirstResponder()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK:- Actions
extension BaseViewController {
    @objc func popBack () {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @objc func searchAction () {}
    @objc func addAction () {}
    
    @objc func saveAction () {}
    
    @objc func logoutAction () {}
    
    
}
import UIKit
extension UITableViewCell {
    /// - Note: Used to Register cell to the passed tableview
    /// - Warning: Name Of the class should be the same as the name of Cell Identifier
    class func register(on tableView: UITableView) {
        tableView.register(UINib(nibName: self.className, bundle: nil), forCellReuseIdentifier: self.className)
    }
}
import Foundation
extension NSObject {
    /// - Note: Used to return the className as String value
    class var className: String {
        return "\(self)"
    }
}
extension UICollectionViewCell {
    /// - Note: Used to Register cell to the passed collectionView
    /// - Warning: Name Of the class should be the same as the name of Cell Identifier
    class func register(on collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: self.className, bundle: nil), forCellWithReuseIdentifier: self.className)
    }
}
