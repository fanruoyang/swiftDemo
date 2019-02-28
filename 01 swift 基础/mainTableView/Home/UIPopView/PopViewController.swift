
//
//  PopViewController.swift
//  01 swift 基础
//
//  Created by ios on 2018/10/12.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

class PopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue
        
        
        let anButton = UIButton()
        
        anButton.frame = CGRect.init(x: 10, y: 100, width: 100, height: 20)
        
        anButton .setTitle("返回", for: .normal)
        
        anButton .addTarget(self, action: #selector(PopViewController.registerClick), for: .touchUpInside)
        
        view .addSubview(anButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


extension PopViewController{
    
    @objc func registerClick(){
        
        print("注fff册")
        dismiss(animated: true, completion: nil)
    }
    
}
