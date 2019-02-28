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
        
        setUI()
        setdata()
        //正则表达式
        setregex()
        self.view.backgroundColor = UIColor.white
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
// MARK:------------------- 数据解析处理归档 -------------------

extension RegistViewController{
    func setdata(){
        
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
        let model = NSKeyedUnarchiver.unarchiveObject(withFile: pathff as String) as? UserModel
        
        FYLog(message: model)
        
        //4 给单例重新赋值，防止数据为空
        
        UserModelTools.shareIntance.model = model
        
        //封装后拿数据方法
        //可以起名字viewModel MVVM
        let uid = UserModelTools.shareIntance.model?.uid
        
        FYLog(message: uid)
        
    }
    
}

// MARK:------------------- 时间处理 -------------------
// 1 分钟内:刚刚  1消失内:15分钟前  1天内 ：3小时前 昨天 昨天03 ：24   一周内 一个月内  一年后

extension RegistViewController{
    func setUI() {
        let label :UILabel = UILabel.init(frame:CGRect(x: 100, y: 100, width: 100, height: 100) )
        
        label.text = "ffff";
        
        self.view.addSubview(label)
        
        
    }
    
}

// MARK:------------------- 正则表达式 -------------------
/*
 - 1 匹配abc
 - 2 包含一个a-z,后面必须是0-9->[a-z][0-9]或者 [a-z]\d
  [a-z]:指的是a到z任意一个
  [a-z]\d：== [0-9]
 - 3 必须第一个是字母，第二个是数字 --> ^[a-z][0-9]$
    ^表示首字母必须是A--z
    {2，10}:2表示存在几位数,加 逗号表示或者的意思。数字到2到10个数字都可以
    [a-z]$ :必须以a-z 的一个字母结尾
 - 4 必须第一个是字母，字母后面跟上 4 - 9 个数字
 - 5 不能是数字0-9
 ^[^0-9]:不能是0到9的数字
 - 6 qq匹配：^[1-9]\d{4,11}$
 - 都是数字
 - 5 - 12位
 - 并且第一位不能是0
 - 7 手机号码匹配 ^1[3578]\d{9}$
 
 
 @"@.*?:" : 第一个是@ . 表示后面是任意符号 * 表示 0个或者多个 ?遇到冒号就截取--不写就截取一个 :表示遇到冒号截取
 @"\\[.*？\\]" \\转义   匹配表情 [偷笑]
 */

extension RegistViewController{
    func setregex() {
        
        let string = "ffffaaffabcfgggabcdd"
   //问题1
        //1 创建正则表达式规则
        let pattern = "abc"
        //2 创建正则表达对象(try try? try!)
        let regex = try? NSRegularExpression(pattern :pattern)
        guard (regex != nil) else {
            
            return
        }
        //3 匹配字符串内容--返回的数组
        let results = regex?.matches(in: string, options: [], range: NSRange(location: 0, length: string.count))
        //4 遍历数组，获取结果
        for result in results! {
            FYLog(message: result.range)
        }
        
        
   //问题2
    }
    
}
