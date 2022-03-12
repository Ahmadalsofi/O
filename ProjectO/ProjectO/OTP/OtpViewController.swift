//
//  OtpViewController.swift
//  ProjectO
//
//  Created by ahmad alsofi on 18/02/2022.
//

import UIKit

class OtpViewController: BaseViewController {

    @IBOutlet weak var codeTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initBackSetup()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapVerifiey(_ sender: Any) {
        if codeTxt.text?.isEmpty ?? true {
            alert(text: "Code is empty", textField: codeTxt)
            return
        }
        
        if codeTxt.text != "1222" {
            alert(text: "Verification code is wrong", textField: codeTxt)
        }
        
        LoginManager.login()
    }
    
    
}
