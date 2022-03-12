//
//  LoginManager.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/03/2022.
//

import Foundation
import UIKit
class LoginManager {
    
    class func login() {
        UserDefaults.standard.set(true, forKey: "isLogin")
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.tabbar()
        }
    }
    
    class func logout() {
        UserDefaults.standard.set(false, forKey: "isLogin")
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.login()
        }
    }
    
    class func isLogin() -> Bool {
        return  UserDefaults.standard.bool(forKey: "isLogin")
    }
}
