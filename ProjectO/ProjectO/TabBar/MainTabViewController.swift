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
        
        
        let storyboard1 = UIStoryboard(name: "ListingPage", bundle: nil)
        let vcHome = storyboard1.instantiateInitialViewController()!
        vcHome.title = homeTab
        vcHome.tabBarItem.image = UIImage(systemName: "house")
        
        let storyboard = UIStoryboard(name: "AddPostTabSB", bundle: nil)
        let vcAddPostTab = storyboard.instantiateInitialViewController()!
        vcAddPostTab.title = addPostTitle
        vcAddPostTab.tabBarItem.image = UIImage(systemName: "plus")

//
        let storyboard2 = UIStoryboard(name: "FavouriteSB", bundle: nil)
        let vc2 = storyboard2.instantiateInitialViewController()!
        vc2.title = favTitle
        vc2.tabBarItem.image = UIImage(systemName: "star")
//
        let storyboard3 = UIStoryboard(name: "InboxSB", bundle: nil)
        let vc3 = storyboard3.instantiateInitialViewController()!
        vc3.title = inboxTitle
        vc3.tabBarItem.image = UIImage(systemName: "tray")
//
        let storyboard4 = UIStoryboard(name: "SettingSB", bundle: nil)
        let vc4 = storyboard4.instantiateInitialViewController()!
        vc4.title = "Setting"
        vc4.tabBarItem.image = UIImage(systemName: "s.circle")
        
        viewControllers = [vcHome, vc3, vcAddPostTab, vc2, vc4]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.selectedIndex = 2
    }
}
