//
//  AddPostTabViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/06/2022.
//

import UIKit

class AddPostTabViewController: UIViewController {
    @IBOutlet weak var postBtn: UIButton!
    
    @IBOutlet weak var qBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = addPostTitle
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapQustion(_ sender: Any) {
        let vc = UIStoryboard.init(name: "AddPostSB", bundle: Bundle.main).instantiateInitialViewController() as? AddPostViewController
        vc?.isItPost = false
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    

    @IBAction func didTapPost(_ sender: Any) {
        let vc = UIStoryboard.init(name: "AddPostSB", bundle: Bundle.main).instantiateInitialViewController() as? AddPostViewController
        vc?.isItPost = true
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
