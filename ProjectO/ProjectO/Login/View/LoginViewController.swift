//
//  LoginViewController.swift
//  ProjectO
//
//  Created by ahmad alsofi on 18/02/2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    let email = "omar@gmail.com"
    let password = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapNewUser(_ sender: Any) {
        self.performSegue(withIdentifier: "SignUp", sender: nil)
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        if (passwordTxt.text?.isEmpty ?? true) {
            let alert = UIAlertController(title: "Password is empty", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        if (emailTxt.text?.isEmpty ?? true) {
            let alert = UIAlertController(title: "Email is empty", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        if emailTxt.text == email  && passwordTxt.text == password {
        
            // OTP
        } else {
            let alert = UIAlertController(title: "email or password is wrong", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
}
