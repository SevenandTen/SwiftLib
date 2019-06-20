//
//  ED_BasicModel.swift
//  SwiftLib
//
//  Created by zw on 2019/6/18.
//  Copyright © 2019 seventeen. All rights reserved.
//

import UIKit


class ED_BasicModel: NSObject, NSCoding  {
    func encode(with aCoder: NSCoder) {
        var count :UInt32 = 0
        let members = class_copyIvarList(self.classForCoder, &count)
        if count == 0 { return }
        if members == nil {return}
        for index in 0..<count{
            let member = members![Int(index)]
            let cName = ivar_getName(member)
            let name = String(cString: cName!, encoding: String.Encoding.utf8)
            aCoder.encode(self.value(forKey: name!), forKey: name!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        var count :UInt32 = 0
        let members = class_copyIvarList(self.classForCoder, &count)
        if count == 0 { return }
        if members == nil {return}
        for index in 0..<count{
            let member = members![Int(index)]
            let cName = ivar_getName(member)
            let name = String(cString: cName!, encoding: String.Encoding.utf8)
            let value = aDecoder.decodeObject(forKey: name!)
            self .setValue(value, forUndefinedKey: name!)
            
        }
    }
    
    
    
    public static func createModelsWithArray(array:Array<Dictionary<String,Any>>?) -> Array<Any> {
        var reslut = Array<Any>.init()
        if array == nil || array!.count == 0 {
            return Array.init()
        }
        for dic in array! {
            let model  = self.init(dic: dic)
            reslut.append(model)
        }
        return reslut
    }
    
   

    public required  init(dic :Dictionary<String,Any>?) {
        super.init()
        let param = self.removeNullPointFromDictionary(dic: dic)
        self.setValuesForKeys(param)
        self.dealWithData(dic: param)
        
        
    }
    
    public required  init(dic : NSDictionary?) {
        super.init()
        let dict = self.removeNullPointFromDictionary(dic: dic)
        let param = dict as! Dictionary<String ,Any>
        self.setValuesForKeys(param)
        self.dealWithData(dic: param)
    }
    
    public required override init() {
        super.init()
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
    public func dealWithData(dic :Dictionary<String,Any>) {
        
    }
}


extension ED_BasicModel {
    public func removeNullPointFromDictionary(dic : Dictionary<String,Any>?) -> Dictionary<String,Any> {
        var param = Dictionary<String,Any>.init()
        if dic == nil || dic!.count == 0 {
            return param
        }
        for key in dic!.keys {
            if dic![key] != nil &&  !(dic![key] is NSNull)  {
                param[key] = dic![key]
            }
        }
        return param
    }
    
    public func removeNullPointFromDictionary(dic : NSDictionary?) -> NSDictionary {
        let param = NSMutableDictionary.init()
        if dic == nil || dic!.count == 0 {
            return param
        }
        for key in dic!.allKeys {
            let value = dic!.object(forKey: key)
            if value != nil && !(value is NSNull) {
                param.setObject(value!, forKey: key as! NSCopying)
            }
        }
        return param
    }
}
