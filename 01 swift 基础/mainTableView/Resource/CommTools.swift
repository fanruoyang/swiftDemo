//
//  CommTools.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/7/24.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit
import Foundation


/// 自定义Log打印
///
/// - Description:
///     考虑到自定义Log要打印方法所在的文件/方法名/行号，以及自定义的内容，同时考虑调用的便捷性，所以要使用默认参数（fileName: String = #file），因此无需调用者传递太多的参数。
///     T 使用泛型，可以让调用者传递任意的类型，进行打印Log的操作。
/// - Parameters:
///   - message: 需要打印的内容
///   - fileName: 当前打印所在文件名 使用#file获取
///   - funcName: 当前打印所在方法名 使用#function获取
///   - lineNum: 当前打印所在行号   使用#line获取
func FYLog<T> (message: T, fileName: String = #file, funcName: String = #function, lineNum: Int = #line) {
    
    #if DEBUG
    
    let file = (fileName as NSString).lastPathComponent
    
    print("-\(file) \(funcName)-[\(lineNum)]: \(message)")
    
    #endif
    
}


let Main_Screen_With = UIScreen.main.bounds.width

let Main_Screen_Height = UIScreen.main.bounds.height

//判断是否是iPhone
let isPhone = Bool(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)

//判断是否是iPhone X
let isPhoneX = Bool(Main_Screen_With >= 375.0 && Main_Screen_Height >= 812.0 && isPhone)

//导航条的高度
let kNavigationHeight = CGFloat(isPhoneX ? 88 : 64)
//状态栏高度
let kStatusBarHeight = CGFloat(isPhoneX ? 44 : 20)
//tabbar高度
let kTabBarHeight = CGFloat(isPhoneX ? (49 + 34) : 49)
//顶部安全区域远离高度
let kTopSafeHeight = CGFloat(isPhoneX ? 44 : 0)

//底部安全区域远离高度
let kBottomSafeHeight = CGFloat(isPhoneX ? 34 : 0)

//let kStatusBarH : CGFloat = 20
//let kNavigationBarH : CGFloat = 44
let kTabbarH : CGFloat = 44

let kScreenW = UIScreen.main.bounds.width
let kScreenH = UIScreen.main.bounds.height
