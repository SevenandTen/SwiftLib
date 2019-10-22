//
//  UIView+Extension.swift
//  SwiftLib
//
//  Created by zw on 2019/10/22.
//  Copyright © 2019 seventeen. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func refresh(obj :Any){
        
    }
    public func refresh(obj : Any ,flag : Bool) {
        
    }
    
    public func refresh(obj1 : Any , obj2 : Any) {
        
    }
    
    public static func instance() -> UIView {
        let classString  = NSStringFromClass(self)
        let classSmallString = classString + "small"
        let type = "nib"
        var view : UIView
        let path = Bundle.main.path(forResource: classString, ofType:type)
        let smallPath = Bundle.main.path(forResource: classSmallString, ofType: type)
        if UIScreen.main.bounds.width <= 320 {
            if smallPath != nil && smallPath!.count > 0 {
                view = Bundle.main.loadNibNamed(classSmallString, owner: nil, options: nil)?.last as! UIView
                return view
            }
          
        }
        if path != nil && path!.count > 0  {
              view = Bundle.main.loadNibNamed(classString, owner: nil, options: nil)?.last as! UIView
              return view
        }
       
        view = self.init()
        return view
    }
    
    public static func defaultIdentifier() -> String {
        return NSStringFromClass(self)
    }
}


