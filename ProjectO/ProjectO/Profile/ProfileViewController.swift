//
//  ProfileViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 12/03/2022.
//

import UIKit
import PhoneNumberKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var confirmPassTxt: UITextField!
    @IBOutlet weak var phoneTxt: PhoneNumberTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            PhoneNumberKit.CountryCodePicker.commonCountryCodes = ["US", "CA", "MX", "AU", "GB", "DE"]
        }
        
        self.phoneTxt.withPrefix = true
        self.phoneTxt.withFlag = true
        self.phoneTxt.withExamplePlaceholder = true
        self.phoneTxt.withDefaultPickerUI = true
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
