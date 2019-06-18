//
//  ED_BasicModel.swift
//  SwiftLib
//
//  Created by zw on 2019/6/18.
//  Copyright © 2019 seventeen. All rights reserved.
//

import UIKit


class ED_BasicModel: NSObject  {
    
    
    public static func createModelsWithArray(array:Array<Dictionary<String,Any>>) -> Array<ED_BasicModel> {
            return Array.init()
    }
    
   

    public init(dic :Dictionary<String,Any>) {
         super.init()
        self.setValuesForKeys(dic)
   
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}


//
//var outCount: UInt32 = 0
//let ivars = class_copyIvarList(self.classForCoder, &outCount)
//if ivars != nil {
//    for i in 0..<outCount
//    {
//        //            ivar是一个结构体的指针
//        let ivar = ivars![Int(i)]
//        let cName = ivar_getName(ivar)
//        if cName != nil {
//            let name = String(cString: cName!, encoding: String.Encoding.utf8)
//        }
//    }
//}else {
//    print("meiyou")
//}
//
//
//
//free(ivars)
//        
