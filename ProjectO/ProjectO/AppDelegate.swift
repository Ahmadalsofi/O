//
//  AppDelegate.swift
//  ProjectO
//
//  Created by ahmad alsofi on 18/02/2022.
//

import UIKit
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        if LoginManager.isLogin() {
            tabbar()
        }
        return true
    }
    
    func tabbar() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let initialViewController = storyboard.instantiateInitialViewController()
  
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }

    func login() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "LoginSB", bundle: nil)
        let initialViewController = storyboard.instantiateInitialViewController()
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }

}

