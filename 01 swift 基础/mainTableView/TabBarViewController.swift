
//
//  TabBarViewController.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/7/25.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
        //MAEK:懒加载属性
   // private lazy  var imagesNames = ["","","","","",""]
    
//    private lazy var addButton: UIButton = UIButton.creatButton(imageName: "setting_help_account", bgImageName:"")
    
    private lazy var addButton : UIButton = UIButton.init(imageName:"setting_help_account", bgImageName: "setting_help_account")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.addSubview(addButton)
      //  addButton.setBackgroundImage(UIImage(named: "home_tab_homepage"), for: .normal)
        addButton.sizeToFit()
        addButton.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height*0.5);
        
    }

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
        for i in 0..<tabBar.items!.count {
            //获取itme
            let itemff = tabBar.items![i]
            //3 如果下标值为2，则该itme不可以和用户交互
            if i==2{
                itemff.isEnabled=false
                
                continue
            }
         
        }
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


