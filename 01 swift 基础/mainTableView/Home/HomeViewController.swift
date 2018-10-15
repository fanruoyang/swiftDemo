//
//  HomeViewController.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/7/25.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit



class HomeViewController: UIViewController {

    //判断转场动画的bool
    var isPresent : Bool = false
    
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
 自定义转场动画的代理，
 presenting 弹出的控制器
 presented 发起的控制器
 
 */
extension HomeViewController : UIViewControllerTransitioningDelegate{
    //1 改变view弹出的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return BasePresentationController (presentedViewController: presented, presenting: presenting)
    }
    //2 自定义弹出动画
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = true
        return self
    }
    
    //3 自定义消失动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }
    
}

// MARK:------------------- 弹出和消失动画的代理方法 -------------------
extension HomeViewController : UIViewControllerAnimatedTransitioning{
    //动画执行的时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.5
    }
    //获取转场的上下文--画布：获取弹出的view和消失的view
    //   UITransitionContextToViewKey : 获取弹出的view
    //   UITransitionContextFromViewKey : 获取消失的view
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresent ? animateTransitionToPresentView(transitionContext: transitionContext):animateTransitionFromPresentView(transitionContext: transitionContext)
        
    }
    
    //自定义弹出动画
    private func animateTransitionToPresentView(transitionContext:UIViewControllerContextTransitioning){
        let presentView = transitionContext.view(forKey: .to)!
        
        transitionContext.containerView.addSubview(presentView)
        presentView.transform = .init(scaleX: 1, y: 0)
        presentView.layer.anchorPoint = CGPoint (x: 0.5, y: 0)
        
        UIView .animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentView.transform = .identity
            
        }) { (_) in
            transitionContext.completeTransition(true)
        }
        
        
        
    }
    //自定义弹出动画
    private func animateTransitionFromPresentView(transitionContext:UIViewControllerContextTransitioning){
        
        //获取消失的view
        let presentView = transitionContext.view(forKey: .from)!
        
        // 动画
        UIView .animate(withDuration: transitionDuration(using: transitionContext), animations: {
         presentView.transform = .init(scaleX: 1, y: 0.0001)
            
        }) { (_) in
            transitionContext.completeTransition(true)
        }
        
        
        
    }
    
    
}

