//
//  RegistViewController.swift
//  01 swift 基础
//
//  Created by ios on 2018/10/16.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit


class RegistViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    
        
        let dict = ["uid":"16","userName":"哈哈哈"]
        let usermodel : UserModel = UserModel()
        
        usermodel.uid = dict["uid"]
        
        FYLog(message: usermodel.uid)
        //将model归档保存
        //1 获取沙河路径
//        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
//        let documentsDirectory = paths.object(at: 0) as! NSString
//        let path = documentsDirectory.appendingPathComponent("text.plist")
//
        
        var  pathff = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! as NSString

        pathff = pathff.appendingPathComponent("text.plist") as NSString

        //这里有问题
        //2 保存
        NSKeyedArchiver.archiveRootObject(usermodel, toFile: pathff as String)
        
        //3 读取
        
        let model = NSKeyedUnarchiver.unarchiveObject(withFile: "text.plist") as? UserModel
        
        FYLog(message: model)
        
        //4 给单例重新赋值，防止数据为空
        
        UserModelTools.shareIntance.model = model
        
        //封装后拿数据方法
        //可以起名字viewModel MVVM
        let uid = UserModelTools.shareIntance.model?.uid
        
        FYLog(message: uid)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
