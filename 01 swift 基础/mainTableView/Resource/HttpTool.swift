//
//  HttpTool.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/6/4.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit


class HttpTool: NSObject {
    var callBack:((_ jsonDota:String) -> ())?
    
    //闭包的类型:(参数列表)->(返回值类型)
    func loadData(callBack:@escaping (_ jsonData:String)->()){
        //强引用下
        self.callBack = callBack
        DispatchQueue.global().async {
            print("发送网络请求:\(Thread.current)")
            let mainQueue = DispatchQueue.main
            mainQueue.sync {
                print("获取到数据:\(Thread.current)")
                FYLog(message: "asd")
                callBack("获取数据")
            }
        }
        
    }
    
    
}
