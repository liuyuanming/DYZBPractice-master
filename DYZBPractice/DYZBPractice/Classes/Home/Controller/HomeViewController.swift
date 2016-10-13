//
//  HomeViewController.swift
//  DYZBPractice
//
//  Created by peter on 16/10/13.
//  Copyright © 2016年 peter. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItems()
        
    }
    
    private func setNavigationItems() {
        setNavigationLeftItem()
        setNavigationRightItem()
    }
    
    private func setNavigationLeftItem() {
        
//        let logoBarButtonItem = UIBarButtonItem(imageName: "logo", hlImageName: nil, size: size, target: self, action: #selector(leftItemClicked))
//        
//            UIBarButtonItem(image: UIImage(named: "logo"), style: .plain, target: self, action: #selector(self.leftItemClicked))
//        navigationItem.leftBarButtonItem = logoBarButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo", hlImageName: "", size: CGSize.zero, target: self, action: #selector(leftItemClicked))
        
    }
    private func setNavigationRightItem() {
        let size = CGSize(width: 40, height: 44)
//        let scanBarButtonItem = UIBarButtonItem.createBarButtonItem(imageName: "Image_scan", hlImageName: "Image_scan_click", size: size, target: self, action: #selector(rightScanItemClicked))
//        
//        let searchBarButtonItem = UIBarButtonItem.createBarButtonItem(imageName: "btn_search", hlImageName: "btn_search_click", size: size, target: self, action: #selector(rightSearchItemClicked))
//        
//        let historyBarButtonItem = UIBarButtonItem.createBarButtonItem(imageName: "image_my_history", hlImageName: "image_my_history_click", size: size, target: self, action: #selector(rightHistoryItemClicked))
        
        // 使用便利构造函数创建
        let scanBarButtonItem = UIBarButtonItem(imageName: "Image_scan", hlImageName: "Image_scan_click", size: size, target: self, action: #selector(rightScanItemClicked))
        
        let searchBarButtonItem = UIBarButtonItem(imageName: "btn_search", hlImageName: "btn_search_clicked", size: size, target: self, action: #selector(rightSearchItemClicked))
        
        let historyBarButtonItem = UIBarButtonItem(imageName: "image_my_history", hlImageName: "Image_my_history_click", size: size, target: self, action: #selector(rightHistoryItemClicked))
        
        navigationItem.rightBarButtonItems = [historyBarButtonItem, searchBarButtonItem, scanBarButtonItem]
    }
    @objc private func leftItemClicked() {
        print("leftItemClicked")
    }
    @objc private func rightScanItemClicked() {
        print("rightScanItemClicked")
    }
    @objc private func rightSearchItemClicked() {
        print("rightSearchItemClicked")
    }
    @objc private func rightHistoryItemClicked() {
        print("rightHistoryItemClicked")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
