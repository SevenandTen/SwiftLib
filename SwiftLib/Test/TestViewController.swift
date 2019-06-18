//
//  TestViewController.swift
//  SwiftLib
//
//  Created by zw on 2019/6/18.
//  Copyright © 2019 seventeen. All rights reserved.
//

import UIKit

class TestViewController: ED_BasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myNavigationItem.title = "测试"
        // Do any additional setup after loading the view.
    }
    

    override func viewMySafeAreaDidChanged() {
        super.viewMySafeAreaDidChanged()
    }
   
}
