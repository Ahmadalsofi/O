//
//  MainTabViewController.swift
//  ProjectO
//
//  Created by Ahmad AlSofi on 11/03/2022.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "ListingPage", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()!
        vc.title = "First"
        vc.tabBarItem.image = UIImage(systemName: "house")
        
        let storyboard2 = UIStoryboard(name: "FavouriteSB", bundle: nil)
        let vc2 = storyboard2.instantiateInitialViewController()!
        vc2.title = "Favorite"
        vc2.tabBarItem.image = UIImage(systemName: "star")
        
        let storyboard3 = UIStoryboard(name: "InboxSB", bundle: nil)
        let vc3 = storyboard3.instantiateInitialViewController()!
        vc3.title = "Inbox"
        vc3.tabBarItem.image = UIImage(systemName: "tray")
        
        let storyboard4 = UIStoryboard(name: "SettingSB", bundle: nil)
        let vc4 = storyboard4.instantiateInitialViewController()!
        vc4.title = "Setting"
        vc4.tabBarItem.image = UIImage(systemName: "s.circle")
        
        viewControllers = [vc, vc2, vc3, vc4]
    }
}
