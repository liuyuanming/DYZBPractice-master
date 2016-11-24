//
//  PageTitleView.swift
//  DYZBPractice
//
//  Created by peter on 16/10/27.
//  Copyright © 2016年 peter. All rights reserved.
//

import UIKit

// MARK:- 定义常量
private let kScrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

class PageTitleView: UIView {

    fileprivate var titles:[String]
    
    // MARK:- 懒加载
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    fileprivate lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    // MARK:- 自定义构造函数
    init(frame: CGRect, titles:[String]) {
        self.titles = titles
        super.init(frame:frame)
        
        // 设置界面
        setUpUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageTitleView {
    fileprivate func setUpUI() {
        addSubview(scrollView)
        setUpTitleLables()
        setUpBottomLineAndScrollLine()
    }
    fileprivate func setUpTitleLables() {
        let labelW : CGFloat = frame.width/CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        for (index, title) in titles.enumerated() {
            let label = UILabel()
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16)
            label.text = title
            label.textAlignment = .center
            label.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
            
            let labelX = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y:labelY, width: labelW, height: labelH)
            
            scrollView .addSubview(label)
            titleLabels.append(label)
            
            label.isUserInteractionEnabled = true
            
            let tapGes = UITapGestureRecognizer(target: self, action:#selector(self.titleLabelClick(_tapGes:)))
            label.addGestureRecognizer(tapGes)
            
        }
    }
    fileprivate func setUpBottomLineAndScrollLine() {
        
    }
}

extension PageTitleView {
    @objc fileprivate func titleLabelClick(_tapGes : UITapGestureRecognizer) {
        
    }
}
