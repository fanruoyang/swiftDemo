//
//  HomeViewController.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/7/25.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK:------------------- 懒加载 -------------------
    //如果闭包中如果使用当前对象或者调用方法，需要加self
    // 俩个地方需要用self 1> 如果一个函数中出现歧义  2> 在闭包中使用当前对象或者函数方法
    // 存在循环引用 在()前面加[weak self] self需要加？可选类型
    private lazy var popoverAnimator = PopoverAnimator.init {[weak self] (presented) in
        self?.titleButton.isSelected = presented
    }
    
    
    private lazy var titleButton : TitleButton = TitleButton()
    
    private lazy var visitorView : UIView = UIView()
    var isLogin : Bool = false
    
    override func loadView() {
        isLogin ? super.loadView():setupVistiorView()
    }
    
    private func setupVistiorView(){
        visitorView.backgroundColor = UIColor.red
        view = visitorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
}

// MARK:------------------- UI 建立 -------------------


extension  HomeViewController{
    
    private func setUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "注册", style: .plain, target: self, action:#selector(HomeViewController.registerClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem (title: "登录", style: .plain, target: self, action:#selector(HomeViewController.loghinClick))
        
        titleButton .setTitle("字体按钮", for: .normal)
        titleButton .addTarget(self, action:#selector(HomeViewController.titleclick), for: .touchUpInside)
        
        navigationItem.titleView = titleButton
   
    }
    
}

// MARK:------------------- 事件监听 -------------------

extension HomeViewController{
    
    @objc func registerClick(){
        
        print("注册")
    }
    
    @objc func loghinClick(){
        print("登录")
    }
    @objc func titleclick(titleButton:TitleButton ){
//        titleButton.isSelected = !titleButton.isSelected
        
        print("title___%d",titleButton.tag)
        // 1 初始化弹出控制器
        let popVc = PopViewController()
        
        //2 不设置的话下面的tabbar控制器会消失---弹出样式
        popVc.modalPresentationStyle = .custom
        //3 改变对应的控制的frame----设置转场的代理
        popVc.transitioningDelegate = popoverAnimator
        
        popoverAnimator.presentedFrame = .init(x: 100, y: 80, width: 180, height: 200)
        //4 弹出
        present(popVc, animated: true, completion: nil)
        
    }
    
}

