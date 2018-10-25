//
//  UserModelTools.swift
//  01 swift 基础
//
//  Created by ios on 2018/10/24.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//  获取归档数据的类别
//  视图模型 viewModel  MVVM

import UIKit

class UserModelTools: NSObject {
    //设计单例
    static let shareIntance : UserModelTools = UserModelTools()
    
//定义属性
    
    var model :UserModel?
    
    var modelPtah : String {
        //这个那沙河路径的方法不知道对不对
        var  pathff = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString
        
        pathff = pathff.appendingPathComponent("text.plist") as NSString
        
        return pathff as String
    }
  
    override init() {
        // 1 重沙盒中读取归档的信息
        // 2 在第一次如果有其他地方使用的时候 数据可能为空，所以在解析数据的时候需要将数据重新赋值 
        model = NSKeyedUnarchiver.unarchiveObject(withFile: "text.plist") as? UserModel
        
    }
    
}
