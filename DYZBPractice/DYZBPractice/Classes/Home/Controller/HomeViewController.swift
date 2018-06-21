//
//  HomeViewController.swift
//  DYZBPractice
//
//  Created by peter on 16/10/13.
//  Copyright © 2016年 peter. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {
    
    fileprivate lazy var pageTitleView : PageTitleView = {
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavgationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView  = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setUpUI()
    }
}

extension HomeViewController {
    fileprivate func setUpUI() {
        
        // 1.设置导航栏
        setUpNavigationBar()
        
        // 2.添加titleView
        self.view.addSubview(pageTitleView)
        
        // 3.添加ContentView
        
    }
    
    fileprivate func setUpNavigationBar() {
        // 1.设置左侧的item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo", hlImageName: "", size: CGSize.zero, target: self, action: #selector(leftItemClicked))
        
        // 2.设置右侧的item
        let size = CGSize(width: 40, height: 44)
        let scanBarButtonItem = UIBarButtonItem(imageName: "Image_scan", hlImageName: "Image_scan_click", size: size, target: self, action: #selector(rightScanItemClicked))
        let searchBarButtonItem = UIBarButtonItem(imageName: "btn_search", hlImageName: "btn_search_clicked", size: size, target: self, action: #selector(rightSearchItemClicked))
        let historyBarButtonItem = UIBarButtonItem(imageName: "image_my_history", hlImageName: "Image_my_history_click", size: size, target: self, action: #selector(rightHistoryItemClicked))
        navigationItem.rightBarButtonItems = [historyBarButtonItem, searchBarButtonItem, scanBarButtonItem]
    }
    
    @objc fileprivate func leftItemClicked() {
        print("leftItemClicked")
    }
    
    @objc fileprivate func rightScanItemClicked() {
        print("rightScanItemClicked")
    }
    
    @objc fileprivate func rightSearchItemClicked() {
        print("rightSearchItemClicked")
    }
    
    @objc fileprivate func rightHistoryItemClicked() {
        print("rightHistoryItemClicked")
    }
}

// MARK:- 遵守PageTitleViewDelegate协议
extension HomeViewController : PageTitleViewDelegate {
    func pageTItleView(_ titleView: PageTitleView, selectedIndex index: Int) {
        
    }
}
