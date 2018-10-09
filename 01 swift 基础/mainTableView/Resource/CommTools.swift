//
//  CommTools.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/7/24.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit


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
