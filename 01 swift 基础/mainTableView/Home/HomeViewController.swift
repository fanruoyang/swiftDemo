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
        titleButton.isSelected = !titleButton.isSelected
        
        print("title___%d",titleButton.tag)
        
        let popVc = PopViewController()
        
        //3 不设置的话下面的tabbar控制器会消失---弹出样式
        popVc.modalPresentationStyle = .custom
        //4 改变对应的控制的frame----设置转场的代理
        popVc.transitioningDelegate = self
        
        present(popVc, animated: true, completion: nil)
        
    }
    
}
/*
 转场动画的代理，
 presented 发起的控制器
 presenting 弹出的控制器
 */
extension HomeViewController : UIViewControllerTransitioningDelegate{
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return BasePresentationController (presentedViewController: presented, presenting: presenting)
    }
    
    
}


