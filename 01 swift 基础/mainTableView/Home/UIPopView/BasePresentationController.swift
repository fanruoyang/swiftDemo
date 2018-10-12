//
//  BasePresentationController.swift
//  01 swift 基础
//
//  Created by ios on 2018/10/12.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

class BasePresentationController: UIPresentationController {
    
    private lazy var coverView : UIView = UIView()
    
//修改控制的view的frame
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
       //弹出的视图
        presentedView?.frame = CGRect (x: 100, y: 100, width: 200, height: 300)
        
        //添加蒙版
        setupCoverView ()
    }
}

extension BasePresentationController{
    private func setupCoverView (){
        // 1.添加蒙版

    containerView?.addSubview(coverView)
        // 2. 设置蒙版属性
        
        coverView.backgroundColor = UIColor(white : 0.8 , alpha: 0.3)
        coverView.frame = containerView!.bounds
        
        // 3. 添加手势
        let  tapGes = UITapGestureRecognizer (target: self, action: #selector(BasePresentationController.coverTap))
        
        coverView.addGestureRecognizer(tapGes)
        
    }
    
    
}

extension BasePresentationController{
    
    @objc private func coverTap(){
        
        
    }
    
}
