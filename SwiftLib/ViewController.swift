//
//  ViewController.swift
//  SwiftLib
//
//  Created by zw on 2019/6/18.
//  Copyright © 2019 seventeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let test = TestModel.init(dic: ["name":"石崎崎"])
        if test.name != nil {
            print(test.name!)
        }else {
            print("五")
        }
        
        print(test.age ?? 0)
        print(test.schoolName ?? "")
        
    }
    
}

