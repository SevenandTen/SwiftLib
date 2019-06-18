//
//  ED_BasicViewController.swift
//  SwiftLib
//
//  Created by zw on 2019/6/18.
//  Copyright © 2019 seventeen. All rights reserved.
//

import UIKit

class ED_BasicViewController: UIViewController {
    public var contentView : UIView! {
        get {
            if _contentView == nil {
                _contentView = UIView.init()
            }
            return _contentView
        }
    }
    private var _contentView : UIView!
    public let myNavigationBar = UINavigationBar.init()
    public let myNavigationItem = UINavigationItem.init()
    public let myNavigationBGView = UIView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.navigationController != nil {
            self.navigationController?.setNavigationBarHidden(true, animated: false)
        }
        
        self.configure_BasicView()
        self.initialization_Basic()
    }
    
    
    private func configure_BasicView () {
        if self.nibName != nil && self.nibName?.count != 0 {
            _contentView = self.view;
            self.view = UIView.init(frame: self.contentView.bounds);
        }
        let someView = UIView.init()
        self.view.addSubview(someView)
        self.view.addSubview(self.contentView)
        self.contentView.frame = self.view.bounds
        self.contentView.autoresizingMask = UIView.AutoresizingMask.init(arrayLiteral: .flexibleHeight , .flexibleWidth)
        if self.isShowMyNavagation() {
            self.view.addSubview(self.myNavigationBGView)
            self.view.addSubview(self.myNavigationBar)
            self.myNavigationBar.pushItem(self.myNavigationItem, animated: false)
            if self.isShowBackBtn() {
                self.myNavigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "normal_back_btn"), style: .done, target: self, action: #selector(self.didClickBaseBack))
            }
        }
    }
    
    private func initialization_Basic() {
        self.myNavigationBGView.backgroundColor = self.myNavigationBarColor()
        self.myNavigationBar.backgroundColor = UIColor.clear
        self.myNavigationBar.setBackgroundImage(UIImage(), for: .default)
        self.myNavigationBar.tintColor = UIColor.white
        self.myNavigationBar.titleTextAttributes = self.myNavgationBarTitleAttribute()
    
    }
    
  
    @objc public func didClickBaseBack() {
        if self.navigationController != nil {
            self.navigationController!.popViewController(animated: true);
        }else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        self.viewMySafeAreaDidChanged()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        self.viewMySafeAreaDidChanged()
    }
    
    
    public func viewMySafeAreaDidChanged() {
        if self.isShowMyNavagation() {
            self.myNavigationBGView.frame = CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: self.ed_navgationBarHeight + self.systemSafeArea.top)
            self.myNavigationBar.frame = CGRect.init(x: 0, y: self.systemSafeArea.top, width: self.view.bounds.width, height: self.ed_navgationBarHeight)
            if self.isLayoutFromOrigin() {
                self.contentView.frame = self.view.bounds
            }else {
                self.contentView.frame = CGRect.init(x: 0, y: self.systemSafeArea.top + self.ed_navgationBarHeight, width: self.view.bounds.width, height: self.ed_navgationBarHeight)
            }
        }else {
            self.contentView.frame = self.view.bounds
        }
        self.view.bringSubviewToFront(self.myNavigationBGView)
        self.view.bringSubviewToFront(self.myNavigationBar)
    
    }
  

}


// safeArea
extension ED_BasicViewController {
    
    public var mySafeArea : UIEdgeInsets! {
        get {

            var top : CGFloat = self.systemSafeArea.top + self.extendMySafeArea.top
            let bottom : CGFloat = self.systemSafeArea.bottom + self.extendMySafeArea.bottom
            let left : CGFloat = self.systemSafeArea.left + self.extendMySafeArea.left
            let right : CGFloat = self.systemSafeArea.right + self.extendMySafeArea.right
            if self.isShowMyNavagation() {
                top = top + self.ed_tabBarHeight
            }
        
            return UIEdgeInsets.init(top: top, left: left, bottom: bottom, right: right)
            
        }
    }
    public var systemSafeArea : UIEdgeInsets! {
        get {
            if #available(iOS 11.0, *) {
                return self.view.safeAreaInsets;
            }
            var bottom : CGFloat = 0;
            if self.tabBarController != nil && !self.tabBarController!.tabBar.isHidden {
                bottom = self.ed_tabBarHeight
            }
            return UIEdgeInsets.init(top: 20, left: 0, bottom: bottom, right: 20 )
        }
    }
    public var extendMySafeArea :UIEdgeInsets! {
        get {
            return self.extendMySafeAreaValue();
        }
    }
    public func extendMySafeAreaValue() -> UIEdgeInsets {
        return UIEdgeInsets.init()
    }
  
    
}

// 基础常量
extension ED_BasicViewController {
    
    public var ed_tabBarHeight : CGFloat! {
        get {
            return UITabBarController.init().tabBar.frame.height;
        }
    }
    
    public var ed_navgationBarHeight : CGFloat! {
        get {
            return UINavigationController.init().navigationBar.frame.height
        }
    }
    
    public func myNavgationBarTitleAttribute() -> Dictionary<NSAttributedString.Key ,Any> {
        
        return [NSAttributedString.Key.foregroundColor : UIColor.white , NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]
    }
 
    public func myNavgationItemAttribute() -> Dictionary<NSAttributedString.Key,Any> {
          return [NSAttributedString.Key.foregroundColor : UIColor.white , NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]
        
    }
    
    public func myNavigationBarColor() -> UIColor {
        return UIColor.init(red: 28/255.0, green: 196/255.0, blue: 102/255.0, alpha: 1)
    }
}

extension ED_BasicViewController {
    public func isShowMyNavagation() -> Bool {
        return true
    }
    
    public func isShowBackBtn() -> Bool {
        return true
    }
    
    public func isLayoutFromOrigin() -> Bool {
        return false
    }
}
