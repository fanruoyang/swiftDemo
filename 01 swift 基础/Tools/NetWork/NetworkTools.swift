//
//  NetworkTools.swift
//  01 swift 基础
//
//  Created by ios on 2018/10/16.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

//单例
class NetworkTools: NSObject {
    //let 是线程安全的
    static let shareInstance : NetworkTools = NetworkTools()
    
}
