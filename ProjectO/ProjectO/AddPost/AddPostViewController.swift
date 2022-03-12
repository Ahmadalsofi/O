//
//  AddPostViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 04/03/2022.
//

import UIKit

class AddPostViewController: UIViewController {
    
    @IBOutlet weak var cardTitleView: UIView!
    @IBOutlet weak var cardBodyView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var postBtn: UIButton!
    @IBOutlet weak var bodyTxt: UITextField!
    @IBOutlet weak var toggleOutLet: UISegmentedControl!
    
    @IBOutlet weak var desTxt: UITextView!
    
    
    @IBOutlet weak var showAgeSwitc: UISwitch!
    @IBOutlet weak var showAgeLbl: UILabel!
    
    @IBOutlet weak var permanentSwitch: UISwitch!
    @IBOutlet weak var permanentLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = "Add Post"
        cardView.layer.cornerRadius = 10
        cardTitleView.layer.cornerRadius = 8
        cardBodyView.layer.cornerRadius = 8
        postBtn.layer.cornerRadius = 8
    }
    
    @IBAction func didTapToggle(_ sender: Any) {
        if toggleOutLet.selectedSegmentIndex == 0 {
            self.titleLbl.text = "Add Post"
            
            self.showAgeSwitc.isHidden = false
            self.showAgeLbl.isHidden = false
            self.permanentSwitch.isHidden = false
            self.permanentLbl.isHidden = false
        }else {
            self.titleLbl.text = "Add Qustion"
            
            self.showAgeSwitc.isHidden = true
            self.showAgeLbl.isHidden = true
            self.permanentSwitch.isHidden = true
            self.permanentLbl.isHidden = true
        }
    }
    

    @IBAction func didTapPost(_ sender: Any) {
        
    }
 
}
