//
//  ViewController.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 30/03/2026.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 =  UINavigationController(rootViewController: UpcommingViewController())
        let vc3 =  UINavigationController(rootViewController: SearchViewController())
        let vc4 =  UINavigationController(rootViewController: DownloadViewController())
        
//        TabBarItem-Images
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "film.fill")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName: "arrow.down")
        
//        TabBarItem-title
        vc1.tabBarItem.title = "Home"
        vc2.tabBarItem.title = "Upcomming"
        vc3.tabBarItem.title = "Top Search"
        vc4.tabBarItem.title = "Download"
        
        tabBar.tintColor = .label
       setViewControllers([vc1,vc2,vc3,vc4], animated: true)
        // Do any additional setup after loading the view.
    }


}

