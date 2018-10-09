//
//  OneViewController.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/7/23.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {
    var tools:HttpTool = HttpTool()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取打印所在文件的路径
       let  file = (#file as NSString).lastPathComponent

        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //防止循环引用
        
        /* 方式一
         weakself?.view:如果前面的可选类型，没有值，后面的代码都不会执行
         如果前面的可选类型有值，系统会自动将weakself进行解包，并且使用weakself
         
         weak var weakself=self
         
         tools.loadData { (jsonData) in
         print("在viewcontroller拿到数据:\(jsonData)")
         weakself?.view.backgroundColor=UIColor.red
         }
         
         //方式二 ，对方式一的写法简化，self 是临时的
         tools.loadData （{[weak self] (jsonData) in
         print("在viewcontroller拿到数据:\(jsonData)")
         self?.view.backgroundColor=UIColor.red
         
         }）
         //方式三 ，一旦self没有值，会发生崩溃,相当于 __weak 修饰弱引用，如果指向对象销毁，那么指针会立马指向nil
         __unsafe_unretained修饰的弱引用，如果指向的对象销毁，那么指针依然指向之前的内存地址，很容易产生野指针，崩溃 僵尸对象
         tools.loadData {[unowned self] (jsonData) in
         print("在viewcontroller拿到数据:\(jsonData)")
         self.view.backgroundColor=UIColor.red
         
         }
         
         */
        
        //解决内存循环的的方法 ：推荐方法二
        //尾随闭包:如果闭包作为方法的最后一个参数，那么闭包就可以将()省略
        
        tools.loadData {[weak self] (jsonData) in
            self?.view.backgroundColor=UIColor.red
        }
        
    }
    
    
    
    
    deinit {
        print("销毁")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
