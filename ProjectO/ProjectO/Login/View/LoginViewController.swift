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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapNewUser(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "SignUpSB", bundle: nil)
        let vc = storyBoard.instantiateInitialViewController()!
        self.navigationController?.pushViewController(vc, animated: true)
        //self.performSegue(withIdentifier: "SignUp", sender: nil)
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        
        if (emailTxt.text?.isEmpty ?? true) {
            let alert = UIAlertController(title: "Email is empty", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _  in
                self.emailTxt.becomeFirstResponder()
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }

        if (passwordTxt.text?.isEmpty ?? true) {
            let alert = UIAlertController(title: "Password is empty", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _  in
                self.passwordTxt.becomeFirstResponder()
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }


        if !isValidEmail(email: emailTxt.text!) {
            let alert = UIAlertController(title: "The email is invalid", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _  in
                self.emailTxt.becomeFirstResponder()
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        
        let data = UserDefaultManager.retriveLoginData()
       
        if data.contains(where: { $0.email == emailTxt.text! && $0.password == passwordTxt.text! }) {
            LoginManager.login()
            LoginManager.saveCurrentEmail(email: emailTxt.text!)
        } else {
            let alert = UIAlertController(title: "email or password is wrong", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
func isValidEmail(email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}
