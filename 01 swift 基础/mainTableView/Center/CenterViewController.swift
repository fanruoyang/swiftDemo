//
//  CenterViewController.swift
//  01 swift 基础
//
//  Created by ios on 2018/10/17.
//  Copyright © 2018年 fanruoyang. All rights reserved.
//

import UIKit
import WebKit

class CenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       self.automaticallyAdjustsScrollViewInsets = false
        
        
        let webView : WebView = WebView()
        webView.frame = .init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        webView.backgroundColor = UIColor.blue
        var config = WkwebViewConfig()
        config.isShowScrollIndicator = false
        config.isProgressHidden = false
        
        webView.delegate = self
        
        // 加载普通URL
        webView.webConfig = config
        webView.webloadType(self, .URLString(url: "https://www.baidu.com"))
        
        
        view .addSubview(webView)
        
        
        view.backgroundColor = UIColor.white
  
                        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "dis", style: .plain, target: self, action:#selector(CenterViewController.registerClick))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension CenterViewController:WKWebViewDelegate{
    
    func webViewUserContentController(_ scriptMessageHandlerArray: [String], didReceive message: WKScriptMessage) {
        print(message.body)
        //js 交互，需要在开始注册
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载")
    }

}

extension CenterViewController{
    
    @objc func  registerClick(){
        
        FYLog(message: "dis")
              dismiss(animated: true, completion: nil)
    }
    
}
