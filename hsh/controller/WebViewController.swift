//
//  WebViewController.swift
//  JCApp
//
//  Created by jacky on 2017/7/17.
//  Copyright © 2017年 wxl. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: BaseViewController, WKScriptMessageHandler, WKNavigationDelegate{
    
    var webView : WKWebView!
    var timer:Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false;
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title = "Introduction"
        self.navigationController?.navigationBar.barTintColor = MAIN_NAVC_COLOR
        self.initSubviews()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(WebViewController.NetworkMonitoring), userInfo: nil, repeats: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        webView.configuration.userContentController.removeScriptMessageHandler(forName: "msgBridge")
        self.webView.navigationDelegate = nil
        
    }
    
    @IBAction func backbtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func NetworkMonitoring(){
//        let reachability = Reachability.reachabilityForInternetConnection()
//
//        //判断连接状态
//        if reachability!.isReachable(){
////            .text = "网络连接：可用"
//
//        }else{
////            statusLabel.text = "网络连接：不可用"
//        }
//
//        //判断连接类型
//        if reachability!.isReachableViaWiFi() {
////            typeLabel.text = "连接类型：WiFi"
//        }else if reachability!.isReachableViaWWAN() {
////            typeLabel.text = "连接类型：移动网络"
//        }else {
////            typeLabel.text = "连接类型：没有网络连接"
//        }
        
    }
    func initSubviews() {
        
        // 创建配置
        let config = WKWebViewConfiguration()
        // 创建UserContentController（提供JavaScript向webView发送消息的方法）
        let userContent = WKUserContentController()
        // 添加消息处理，注意：self指代的对象需要遵守WKScriptMessageHandler协议，结束时需要移除
        userContent.add(self, name: "msgBridge")
        // 将UserConttentController设置到配置文件
        config.userContentController = userContent
        // 高端的自定义配置创建WKWebView
        let webView = WKWebView(frame: UIScreen.main.bounds, configuration: config)
        // 设置访问的URL
        let url:URL = NSURL.init(string: "http://127.0.0.1:8020/HelloHBuilder/teset.html")! as URL
        // 根据URL创建请求
        let requst = NSURLRequest.init(url:url)
        // 设置代理
        webView.navigationDelegate = self
        // WKWebView加载请求
        webView.load(requst as URLRequest)
        // 将WebView添加到当前view
        view.addSubview(webView)
        if NSUser.getNormalDefault(key: "first") == nil{
            let item = UIBarButtonItem.init(title: "", style: .plain, target: self, action: nil)
            self.navigationItem.leftBarButtonItem = item
        }else{
            
        }
        self.webView = webView
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // 判断是否是调用原生的
        if "msgBridge" == message.name {
            // 判断message的内容，然后做相应的操作
            self.navigationController?.popViewController(animated: true)
        }
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let str = navigationAction.request.url?.absoluteString
        
        decisionHandler(WKNavigationActionPolicy.allow)
        if (str?.contains("https://"))!{
            self.dealPayAction(url: str!)
        }else if(str?.contains("http://"))! {
            self.dealPayAction(url: str!)
        }
        //
        NSLog("在请求发送之前，决定是否跳转。  1")
    }
    func dealPayAction(url:String){
        let action = URL.init(string: url)

            UIApplication.shared.openURL(action!)
//        }
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
        //        SVProgressHUD.show()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        //        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        //        SVProgressHUD.dismiss()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

