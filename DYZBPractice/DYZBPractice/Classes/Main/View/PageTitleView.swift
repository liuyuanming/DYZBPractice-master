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

protocol PageTitleViewDelegate : class {
    func pageTItleView(_ titleView : PageTitleView, selectedIndex index : Int)
}

class PageTitleView: UIView {

    // MARK:- 定义属性
    fileprivate var titles:[String]
    fileprivate var currentIndex: Int = 0
    weak var delegate : PageTitleViewDelegate?
    
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
        scrollView.frame = bounds
        
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
            
            let tapGes = UITapGestureRecognizer(target: self, action:#selector(self.titleLabelClick(_:)))
            label.addGestureRecognizer(tapGes)
            
        }
    }
    fileprivate func setUpBottomLineAndScrollLine() {
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: self.bounds.height - lineH, width: frame.width, height: lineH)
        scrollView.addSubview(bottomLine)
        
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        
        scrollLine.frame = CGRect(x: firstLabel.frame.minX, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
        scrollView.addSubview(scrollLine)
        
    }
}

extension PageTitleView {
    @objc fileprivate func titleLabelClick(_ tapGes : UITapGestureRecognizer) { // @objc修饰的可以被OC调用
        guard let currentLabel = tapGes.view as? UILabel else {
            return
        }
        if currentLabel.tag == currentIndex { return }
        
        let oldLabel = titleLabels[currentIndex]
        oldLabel.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        currentLabel.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        
        currentIndex = currentLabel.tag
        
        let scrollLineX = CGFloat(currentIndex) * self.scrollLine.frame.width
        UIView.animate(withDuration: 0.15, animations: {
            self.scrollLine.frame.origin.x = scrollLineX
        })
        delegate?.pageTItleView(self, selectedIndex: currentIndex)
    }
}

extension PageTitleView {
    func setTitleWithProgress(_ progress : CGFloat, sourceIndex : Int, targetIndex : Int) {
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        
        let totalDetaX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let detaX = totalDetaX * progress
        
        scrollLine.frame.origin.x = detaX + sourceLabel.frame.origin.x
        
        let colorDeta = (kSelectColor.0 - kNormalColor.0, kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
        
        targetLabel.textColor = UIColor(r: colorDeta.0 * progress, g: colorDeta.1 * progress, b: colorDeta.2 * progress)
        sourceLabel.textColor = UIColor (r: kSelectColor.0 - colorDeta.0 * progress, g: kSelectColor.1 - colorDeta.1 * progress, b: kSelectColor.2 - colorDeta.2 * progress)
        
        currentIndex = targetIndex
    }
}
