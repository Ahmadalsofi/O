//
//  AppDelegate.swift
//  ProjectO
//
//  Created by ahmad alsofi on 18/02/2022.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        if LoginManager.isLogin() {
            tabbar()
        }
        
        FirebaseApp.configure()
        
        print("____")

        
        //Optional("5DA8C495-21D5-48EC-B80F-6379F3177C19")
        //  Optional("660914E6-9C87-4C44-8B39-4E142294CAE4")
//        FavDefaultManager.create(post: FavModel(postID: "5DA8C495-21D5-48EC-B80F-6379F3177C19", email: "alsofiahmad@yahoo.com"))
//        FavDefaultManager.create(post: FavModel(postID: "660914E6-9C87-4C44-8B39-4E142294CAE4", email: "alsofiahmad@yahoo.com"))

      
        
        UserDefaultManager.retriveLoginData().forEach { item  in
            print(item.email)
            print(item.password)
        }
        
        UserDefaultManager.update(oldEmail: "d@yahoo.com", email: "w", password: "1")
        
        UserDefaultManager.retriveLoginData().forEach { item  in
            print(item.email)
            print(item.password)
        }
        
//        FavDefaultManager.remove(post: FavModel(postID: "5DA8C495-21D5-48EC-B80F-6379F3177C19", email: "alsofiahmad@yahoo.com"))
//        print("NEW")
//        FavDefaultManager.retrive().forEach { item  in
//            print(item.postID)
//        }
        print("____")
        
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

