//
//  DiscoverViewController.swift
//  01 swift 基础
//
//  Created by fanruoyang on 2018/7/25.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class DiscoverViewController: UIViewController {
    
    // MARK:- 懒加载属性
    fileprivate lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y:kNavigationHeight, width: Main_Screen_With, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
        }()
    
    
    
    fileprivate lazy var pageContentView : PageContentView = {[weak self] in
        
        // 1.确定内容的frame
        let contentH = kScreenH - kNavigationHeight - kTitleViewH - kTabbarH
        let contentFrame = CGRect(x: 0, y: kNavigationHeight + kTitleViewH, width: kScreenW, height: contentH)
        
        // 2.确定所有的子控制器
        var childVcs = [UIViewController]()
        childVcs.append(RecommendViewController())
        childVcs.append(GameViewController())
        childVcs.append(AmuseViewController())
        childVcs.append(FunnyViewController())
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 0.不需要调整UIScrollView的内边距
        
        automaticallyAdjustsScrollViewInsets = false
        // 1.设置导航栏
        setupNavigationBar()
   
        // 2.添加TitleView
        view.addSubview(pageTitleView)
        
        // 3.添加ContentView
        view.addSubview(pageContentView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

// MARK:------------------- 如何封装uibutton 点击事件------------------- 需要改好多感觉
extension DiscoverViewController{
    
    private func setupNavigationBar() {
        // 1.设置左侧的Item
           navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
                // 2.设置右侧的Item
                let size = CGSize(width: 40, height: 40)
        ////        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        //
           let image = UIImage(named:"image_my_history")?.withRenderingMode(.alwaysOriginal)
                let historyItem = UIBarButtonItem(image:image, landscapeImagePhone: UIImage(named:"Image_my_history_click"), style:.plain, target: self, action: #selector(DiscoverViewController.registerClick))
        
                let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
                let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        
                navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
        
        
    }
}

extension DiscoverViewController{
    
    @objc func registerClick(){
        FYLog(message: "第一次")
        print("注册")
    }
    
}

// MARK:- 遵守PageTitleViewDelegate协议
extension DiscoverViewController : PageTitleViewDelegate {
    
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int) {
        pageContentView.setCurrentIndex(index)
    }
}


// MARK:- 遵守PageContentViewDelegate协议
extension DiscoverViewController : PageContentViewDelegate {
    
    func pageContentView(_ contentView: PageContentView, _ progress: CGFloat, _ sourceIndex: Int, _ targetIndex: Int) {
          pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)

    }
}
