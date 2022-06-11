//
//  ProfileViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 12/03/2022.
//

import UIKit
import PhoneNumberKit

class ProfileViewController: BaseViewController, SKUIDatePickerDelegate {
    
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var confirmPassTxt: UITextField!
    
    private var skUIdatePicker: SKUIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            PhoneNumberKit.CountryCodePicker.commonCountryCodes = ["US", "CA", "MX", "AU", "GB", "DE"]
        }
        
        initBackSetup()
        self.title = "Profile"
        
        self.emailTxt.text = LoginManager.currentEmail()
        
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        
        skUIdatePicker = SKUIDatePicker()
        skUIdatePicker?.delegate = self
        skUIdatePicker?.showDatePicker(txtDatePicker:ageTxt)
    }
    
    
    func getDate(_ sKUIDatePicker:SKUIDatePicker, date:String) {
        self.ageTxt.text = date
        self.view.endEditing(true)
    }
    func cancel(_ sKUIDatePicker:SKUIDatePicker){
        self.view.endEditing(true)
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func didTapClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didTapUpdate(_ sender: Any) {
        
        if (emailTxt.text?.isEmpty ?? true) {
            let alert = UIAlertController(title: "Email is empty", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _  in
                self.emailTxt.becomeFirstResponder()
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        if (passTxt.text?.isEmpty ?? true) {
            let alert = UIAlertController(title: "Password is empty", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { _  in
                self.passTxt.becomeFirstResponder()
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
        
        if passTxt.text != confirmPassTxt.text {
            alert(text: "password and confirm password does not match", textField: passTxt)
            return
        }
        
        
        if emailTxt.text! != LoginManager.currentEmail() {
            if UserDefaultManager.retriveLoginData().contains(where: { $0.email == emailTxt.text! }) {
                alert(text: "Email Already exists", textField: emailTxt)
                return
            }
        }
        
        
        UserDefaultManager.update(oldEmail: LoginManager.currentEmail(), email: self.emailTxt.text!, password: self.passTxt.text!)
        let alert = UIAlertController(title: "Profile Has been update", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _  in
            
            self.dismiss(animated: true)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
        // let data = UserDefaultManager.retriveLoginData()
        
        //        if data.contains(where: { $0.email == emailTxt.text! && $0.password == passTxt.text! }) {
        //            LoginManager.login()
        //            LoginManager.saveCurrentEmail(email: emailTxt.text!)
        //        } else {
        //            let alert = UIAlertController(title: "email or password is wrong", message: "", preferredStyle: .alert)
        //            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        //            alert.addAction(action)
        //            self.present(alert, animated: true, completion: nil)
        //        }
    }
}

import UIKit

protocol SKUIDatePickerDelegate:class {
    func getDate(_ sKUIDatePicker:SKUIDatePicker, date:String)
    func cancel(_ sKUIDatePicker:SKUIDatePicker)
}

class SKUIDatePicker: UIView {
    
    private let datePicker = UIDatePicker()
    private var dateFormate = "yyyy/mm/dd"
    weak var delegate:SKUIDatePickerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // self.frame = UIScreen.main.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showDatePicker(txtDatePicker:UITextField){
        //Formate Date
        datePicker.datePickerMode = .date
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action:       #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem:       UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action:       #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated:       false)
        
        txtDatePicker.inputAccessoryView = toolbar
        txtDatePicker.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormate
        let result = formatter.string(from: datePicker.date)
        self.delegate?.getDate(self, date: result)
        
    }
    
    @objc func cancelDatePicker(){
        self.delegate?.cancel(self)
    }
    
}
