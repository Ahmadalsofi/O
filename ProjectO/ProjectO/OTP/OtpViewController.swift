//
//  OtpViewController.swift
//  ProjectO
//
//  Created by ahmad alsofi on 18/02/2022.
//

import UIKit
import Firebase

class OtpViewController: BaseViewController {

    @IBOutlet weak var codeTxt: UITextField!
    
    var userSignUpModel: UserSignUpModel?
    var verificationID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initBackSetup()
        
        print(userSignUpModel?.phone)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let phone = self.userSignUpModel?.phone ?? ""
            PhoneAuthProvider.provider()
                .verifyPhoneNumber(phone, uiDelegate: nil) { verificationID, error in
                  if let error = error {
                      self.alert(text: error.localizedDescription, textField: self.codeTxt)
                    return
                  }
                    self.verificationID = verificationID
                    print(verificationID)
              }
        }
    }
    
    
    @IBAction func didTapVerifiey(_ sender: Any) {
        if codeTxt.text?.isEmpty ?? true {
            alert(text: "Code is empty", textField: codeTxt)
            return
        }
        if verificationID?.isEmpty ?? true  {
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID!,
          verificationCode: codeTxt.text!
        )
        
        
        Auth.auth().signIn(with: credential) { [self] authResult, error in
            if let error = error {
              let authError = error as NSError
              if authError.code == AuthErrorCode.secondFactorRequired.rawValue {
                // The user is a multi-factor user. Second factor challenge is required.
                let resolver = authError
                  .userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
                var displayNameString = ""
                for tmpFactorInfo in resolver.hints {
                  displayNameString += tmpFactorInfo.displayName ?? ""
                  displayNameString += " "
                }
              } else {
                  self.alert(text: error.localizedDescription, textField: self.codeTxt)
                return
              }
              // ...
              return
            }
            print("DONNNNNENENENNENENENE")
            
            UserDefaultManager.login(email: self.userSignUpModel!.email ?? "", password: self.userSignUpModel!.password ?? "")
            LoginManager.saveCurrentEmail(email: self.userSignUpModel!.email!)
            LoginManager.login()
        }
    }
}
