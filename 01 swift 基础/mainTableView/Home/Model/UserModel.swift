//
//  UserModel.swift
//  01 swift 基础
//
//  Created by ios on 2018/10/23.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

class UserModel: NSObject ,NSCoding{

    var access_tokenn : String?
    var uid : String?
    var userName :String?
    
    func initdict(dict :[String :AnyObject]) {
  
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    // MARK:------------------- 重新 description 属性 -------------------
     // 将模型转换为字典
//    override var description: String{
//        // 将字典转换为字符串
//        return dictionaryWithValues(forKeys: ["uid","userName"]).description
//        
//    }
    
    // MARK:------------------- 归档 解档 -------------------
    //归档
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(userName, forKey: "userName")
        
    }
    //解档
    required init?(coder aDecoder: NSCoder) {
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        userName = aDecoder.decodeObject(forKey: "userName") as? String
        
    }
    override init() {
        super.init()
    }
    
    
    
    
}
