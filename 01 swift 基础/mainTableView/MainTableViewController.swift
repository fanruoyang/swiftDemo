//
//  MainTableViewController.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/6/4.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit



class MainTableViewController: UIViewController {
    //注释
    // MARK:---懒加载
    //  let textarry:[String] = ["简单建立", "我从哪里来", "要到哪里去"]
    // MARK:---系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
 
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension UIViewController{
    func setupUI() {
        /// tableview的属性
        let mainTableView:UITableView = UITableView()
        //创建tabelview
        view.addSubview(mainTableView)
        mainTableView.frame=CGRect.init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height-66)
        mainTableView.delegate=self
        mainTableView.dataSource=self
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        
        self.view.addSubview(mainTableView)
        
    }
    
}
//extension 类似OC的category,也是只能扩充方法，不能扩充属性
extension UIViewController :UITableViewDataSource,UITableViewDelegate{
    //let textarry:[String] = ["简单建立", "我从哪里来", "要到哪里去"]
    // MARK:---tableview的数据源和代理方法
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1 创建cell 初始化的时候有使用register的方法
        //        let CellID="cellID"
        //        var cell = tableView.dequeueReusableCell(withIdentifier: CellID)
        //        if cell==nil {
        //            cell=UITableViewCell(style: .default, reuseIdentifier: CellID)
        //        }
        //
        
        //2 设置数据
        //3 返回cell
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)) as UITableViewCell
        
        //swift 的枚举使用  1> 枚举类型.具体的类型 2> .具体的类型
        // cell.textLabel?.text = textarry[indexPath.row]
        return cell
    }
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("点击0")
            guard let jsonPath = Bundle.main.path(forResource: "MainVcSetting", ofType: "json")  else {
                
                print("没有获取到对应文件路径")
                return
            }
            
            guard let jsonData = NSData.init(contentsOfFile: jsonPath) else {
                print("没有数据")
                return
            }
            
            //  将NSdata转成数组
            /*  如果在调用系统的某一个方法时，该方法最后有一个throws，说明该方法会抛出异常，如果一个方法会抛出异常，那么对该异常进行处理
             在swift中提供 三种处理异常的方法
             方式一： try方式，手动捕捉异常
             do {
             try JSONSerialization.jsonObject(with: jsonData as Data, options:[])
             
             }catch{
             
             print(error)
             }
              方式二 ： try?方式，手动捕捉异常
             guard  let json = try? JSONSerialization.jsonObject(with: jsonData as Data, options:[]) as![[String:AnyObject]] else {
             return
             }
             
             方法三: try! 没有异常 不推荐
             let json = try! JSONSerialization.jsonObject(with: jsonData as Data, options:[]) as![[String:AnyObject]] else {
             
             */
            
        
            
            
            guard  let json = try? JSONSerialization.jsonObject(with: jsonData as Data, options:[]) as![[String:AnyObject]] else {
                return
            }
            
            for dict in json {
                print(dict)
            }
            break
            
        default:
            break
        }
    }
    
    
    
    
}

//    //定义一个方法
//    func demo(){
//        var x=10  //声明一个常量
//            x=20
//        let y = 20.5
//        print(x)
//        print(y)
//        // 自动推导 :变量和常量的类型会根据右侧代码执行的结果推导出来
//        // 查看类型 : option+click
//        // swift在任何不同数据之间，不允许直接运算,需要指定类型
//       //1
//        print(Double(x)+y)
//        //2
//        let a : Double=100
//        let b = 12.5
//        print(a+b)
//
//        //可选项定义 optional
//        //输出是一个可选值 开发中不这么写
//        let c :Optional = 10
//        let d :Int? = 20  //可能是int类型
//
//        print(c!)//！是强行解包 有时候会出问题 为nil 的时候判断
//
//        print(d!)
//
//
//    }

