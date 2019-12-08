//
//  Comments.swift
//  huajizhihu
//
//  Created by 于隆祎 on 2019/11/25.
//  Copyright © 2019 于隆祎. All rights reserved.
//

import Foundation
import MJRefresh
import Alamofire

import UIKit

class Comments: UIViewController{
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        initview()
        
        
        
        
        
    }
    func initview() {
        view.backgroundColor = .white
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
        tableView.backgroundColor = .white
        tableView.bounces = true
        tableView.allowsSelection = true
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }

}
extension Comments: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            
       
         tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension Comments: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}

