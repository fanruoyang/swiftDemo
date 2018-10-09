//
//  UIButton-Extension.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/9/6.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

extension UIButton{
    //swift中 类方法是class 开头的方法，类似于OC中+开头的方法
//    class func creatButton(imageName:String, bgImageName:String)->UIButton{
//        
//        let btn = UIButton()
//        
//        btn.setImage(UIImage (named:imageName), for: .normal)
//        btn.setBackgroundImage(UIImage (named:bgImageName), for: .normal)
//        
//        return btn
//    }
//    
   // convenience :便利，使用convenience 修饰的构造函数叫做便利构造函数
    // 遍历构造函数的通常用在对类进行构造函数的扩充时使用
    /*
     遍历构造函数的特点
     1. 便利构造函数通常都是写在extension 里面
     2. 便利构造函数init前面需要加载convenience
     3. 在便利构造函数中需要明确使用self.init()
     4. asdad
    */
    
    convenience init (imageName :String ,bgImageName :String){
        self.init()
        setImage(UIImage (named:imageName), for: .normal)
        setBackgroundImage(UIImage (named:bgImageName), for: .normal)
    }
    
    
}
