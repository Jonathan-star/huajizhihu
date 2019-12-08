//
//  webViewNews.swift
//  huajizhihu
//
//  Created by 于隆祎 on 2019/12/3.
//  Copyright © 2019 于隆祎. All rights reserved.
//

import Foundation
import WebKit
import SnapKit


 
class news: UIViewController {

    let tabbar = UITabBar(frame: CGRect(x: 0, y: 820, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//    var item = [UITabBarItem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: UIScreen.main.bounds.height))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .rewind, target: self, action: #selector(comment))
        
        let request = URLRequest(url: URL(string:storyUrl[num])!)
        webView.load(request)
        view.addSubview(webView)
        
//       MARK: -tabbar设置？= 3 =
//        tabbar.backgroundColor = .green
//        item.append(UITabBarItem.init(title: "", image: UIImage(systemName: "chevron.left"), tag: 1))
//        item.append(UITabBarItem.init(title: "", image: UIImage(systemName: "bubble.left"), tag: 0))
//        tabbar.setItems(item, animated: true)
//
//MARK: 长评还没有写= 3 =
//        view.addSubview(tabbar)
        
//        let vc1:UIViewController = ViewController()
//        let nav1 = UINavigationController(rootViewController:vc1)
//        nav1.tabBarItem = UITabBarItem(title:"",image:UIImage(systemName: "chevron.left"), selectedImage:UIImage(named:"icon_home_menu01_after"))
//
//        let vc2:UIViewController = Comments()
//        let nav2 = UINavigationController(rootViewController:vc2)
//        nav2.tabBarItem = UITabBarItem(title:"",image:UIImage(systemName: "bubble.left"),selectedImage:UIImage(named:"icon_home_menu02_after"))
//
//
        
        
        
//        let tabBar = UITabBar()
//        tabBar.items = [UITabBarItem(title: "", image: UIImage (systemName: "chevron.left"), tag: 20)]
//        view.addSubview(webView)
    
    }
        
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @objc func comment() {
        navigationController?.pushViewController(Comments(), animated: true)
        
        
    }
}

