//
//  MessageViewController.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/7/25.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "注册", style: .plain, target: self, action:#selector(MessageViewController.registerClick))
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}



extension MessageViewController{
    
    @objc func registerClick(){
        
        print("注册")
        
        let regisVC = RegistViewController ()
        
        self.navigationController?.pushViewController(regisVC, animated: true)
        
        
        
    }
    
}
