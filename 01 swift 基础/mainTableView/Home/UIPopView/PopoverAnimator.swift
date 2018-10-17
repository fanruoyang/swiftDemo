//
//  PopoverAnimator.swift
//  01 swift 基础
//
//  Created by ios on 2018/10/16.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

class PopoverAnimator: NSObject {
    //判断转场动画的bool
    var isPresent : Bool = false
    var presentedFrame :CGRect = .zero
    //自定义构造函数 闭包 block
    
   var callBack:((_ presented:Bool) -> ())?
    //如果自定义了一个构造函数，但是没有对默认的init()进行重写，那么自定义构造函数会覆盖默认的函数方法，如果需要的话需要重写，2
    init(callBack:((_ presented:Bool) -> ())?) {
        self.callBack = callBack
    }
    //2 重写默认方法
    override init() {
        
    }

    
    
    
}

/*
 自定义转场动画的代理，
 presenting 弹出的控制器
 presented 发起的控制器
 
 */
extension PopoverAnimator : UIViewControllerTransitioningDelegate{
    //1 改变view弹出的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentView = BasePresentationController (presentedViewController: presented, presenting: presenting)
        
        presentView.presentedFrame = presentedFrame
            //.init(x: 100, y: 80, width: 180, height: 200)
        
        return presentView
    }
    //2 自定义弹出动画
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = true
        //! 强制解包 保证有值
        callBack!(isPresent)
        return self
    }
    
    //3 自定义消失动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
    
        callBack!(isPresent)
        return self
    }
    
}

// MARK:------------------- 弹出和消失动画的代理方法 -------------------
extension PopoverAnimator : UIViewControllerAnimatedTransitioning{
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
        
        // 动画 0.0001有动画效果，如果是0就直接消失了
        UIView .animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentView.transform = .init(scaleX: 1, y: 0.0001)
            
        }) { (_) in
            transitionContext.completeTransition(true)
        }
        
        
        
    }
    
    
}
