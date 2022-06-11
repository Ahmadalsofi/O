//
//  SignUpViewController.swift
//  ProjectO
//
//  Created by ahmad alsofi on 18/02/2022.
//

import UIKit
import PhoneNumberKit
import ContactsUI
class SignUpViewController: BaseViewController, CNContactPickerDelegate {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var passwordConfTxt: UITextField!
    
    @IBOutlet weak var phoneTxt: PhoneNumberTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initBackSetup()
        if #available(iOS 11.0, *) {
            PhoneNumberKit.CountryCodePicker.commonCountryCodes = ["US", "CA", "MX", "AU", "GB", "DE"]
        }
        
        self.phoneTxt.withPrefix = true
        self.phoneTxt.withFlag = true
        self.phoneTxt.withExamplePlaceholder = true
        self.phoneTxt.withDefaultPickerUI = true
    }
    
    @IBAction func didTapSignup(_ sender: Any) {
        if emailTxt.text?.isEmpty ?? true {
            alert(text: "Email is empty", textField: emailTxt)
            return
        }
        
        if passwordTxt.text?.isEmpty ?? true {
            alert(text: "Password is empty", textField: passwordTxt)
            return
        }
        
        if passwordConfTxt.text?.isEmpty ?? true {
           alert(text: "Confirm Password is empty", textField: passwordTxt)
            return
        }
        
        if phoneTxt.text?.isEmpty ?? true {
            alert(text: "Phone is empty", textField: phoneTxt)
            
            return
        }
        
        if passwordTxt.text != passwordConfTxt.text {
            alert(text: "password and confirm password does not match", textField: passwordTxt)
            return
        }
        
        if !phoneTxt.isValidNumber {
            alert(text: "Phone number is invalid", textField: phoneTxt)
            return
        }
        
        if !isValidEmail(email: emailTxt.text!) {
            alert(text: "The email is invalid", textField: emailTxt)
            return
        }
        
        let data = UserDefaultManager.retriveLoginData()
       
        if data.contains(where: { $0.email == emailTxt.text! }) {
            alert(text: "Email Already exists", textField: emailTxt)
            return
        }
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "OtpSB", bundle: nil)
        let vc = storyBoard.instantiateInitialViewController() as! OtpViewController
        let dataNew = UserSignUpModel()
        dataNew.email = self.emailTxt.text!
        dataNew.password = self.passwordTxt.text!
        dataNew.phone = self.phoneTxt.text!
        vc.userSignUpModel = dataNew
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

