//
//  MainViewController.swift
//  DYZBPractice
//
//  Created by peter on 16/10/13.
//  Copyright © 2016年 peter. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    // MARK:- 下边这两个方法目的是不使用iOS9 Storyboard Reference时使用
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC("Home")
        addChildVC("Live")
        addChildVC("Follow")
        addChildVC("Profile")
        
    }
    fileprivate func addChildVC(_ storyName: String){ // '_'的目的是在调用的时候不写 storyName
        let childViewController = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        self.addChildViewController(childViewController)
    }
}
