//
//  FunctionViewController.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/7/23.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit


class FunctionViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let testView = UIView()
        testView.backgroundColor = UIColor.cyan
        view.addSubview(testView)
        testView.snp.makeConstraints { (make) in
            make.width.equalTo(100)         // 宽为100
            make.height.equalTo(100)        // 高为100
            make.center.equalTo(view)       // 位于当前视图的中心
        }
            let dict = ["age":"16","hight":"170"]
        NetworkTools.shareInstance.post(url: "", param:dict, successBlock: { (dict, HomeModel) in
            
        }) { (AFSErrorInfo) in
            print("%@",AFSErrorInfo.code)
        }

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
