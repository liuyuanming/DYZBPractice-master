//
//  UIBarButtonItem-Extension.swift
//  DYZBPractice
//
//  Created by peter on 16/10/13.
//  Copyright © 2016年 peter. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    class func createBarButtonItem(imageName: String = "", hlImageName: String = "", size: CGSize = CGSize.zero, target: AnyObject?, action: Selector) -> UIBarButtonItem {
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setImage(UIImage(named: hlImageName), for: .highlighted)
        if size == CGSize.zero {
            button.sizeToFit()
        } else {
            button.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        }
        button.addTarget(target, action: action, for: .touchUpInside)
        
        return UIBarButtonItem(customView: button)
    }
    
    // MARK:- 便利构造函数，推荐方式 （与上边方法相比）
    convenience init(imageName: String = "", hlImageName: String = "", size: CGSize = CGSize.zero, target: AnyObject?, action: Selector) {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: UIControlState())
        if hlImageName != "" {
            button.setImage(UIImage(named: hlImageName), for: .highlighted)
        }
        if size == CGSize.zero {
            button.sizeToFit()
        } else {
            button.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        }
        button.addTarget(target, action: action, for: .touchUpInside)
        
        self.init(customView: button)
    }
    
    convenience init(imageName : String, highImageName : String = "", size : CGSize = CGSize.zero)  {
        // 1.创建UIButton
        let btn = UIButton()
        
        // 2.设置btn的图片
        btn.setImage(UIImage(named: imageName), for: UIControlState())
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        // 3.设置btn的尺寸
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        // 4.创建UIBarButtonItem
        self.init(customView : btn)
    }

}
