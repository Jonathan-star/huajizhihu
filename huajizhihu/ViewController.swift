//
//  ViewController.swift
//  huajizhihu
//
//  Created by 于隆祎 on 2019/11/18.

//  Copyright © 2019 于隆祎. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

//MARK: -搞了几个数组

var titles = [String]()
var imageUrls = [String]()
var hints = [String]()

class ViewController: UIViewController {

    var tableView = UITableView()
    
    let pics = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 500))

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadTableview()
        loadData()
        print(titles.count)

    }
    
//   MARK: -界面设置
    
    func loadTableview() {
        
        tableView.backgroundColor = .white
        tableView.frame = view.bounds
        tableView.tableHeaderView = pics
        tableView.allowsSelection = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        loadNavigation()
        view.addSubview(tableView)
        
    }
    
//    MARK: -navigationBar设置
    
    func loadNavigation() {
       
        navigationController?.navigationBar.barTintColor = .green
        navigationController?.navigationBar.tintColor = .white
//        let date = Date.init()
//        let timeFormatter = DateFormatter.init()
//        timeFormatter.dateFormat = "MM月\ndd日"
//        _ = timeFormatter.string(from: date)
        navigationItem.title = "FUNNY DAILY"
        

//        if let barFont = UIFont(name: "ChalkboardSE-Bold" , size: 24){
//        }

    }
    
//    MARK: -"我也不知道该不该写的"刷新
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
        tableView.reloadData()
        print(imageUrls)
        
    }
    
//   MARK: -加入标题
        
    func loadData() {
//        alama.alamofireGet(someclosure: tableView.reloadData)
        alama.alamofireGet { titles in
            print(titles)
            self.tableView.reloadData()
        }
        if titles.isEmpty {
            print("nothing")
        } else {
            print("ok")
        }
    }
    
//    MARK: -scrollView设置
    func loadScrollView() {
        pics.isPagingEnabled = true
        pics.isScrollEnabled = true
        pics.bounces = false
        pics.contentSize = CGSize(width: UIScreen.main.bounds.width * 5, height: 400)
//        for i in 0..<5 {
//
//        }
        pics.showsVerticalScrollIndicator = false
        pics.showsHorizontalScrollIndicator = false
    }
}
    
//     MARK: -"我也不清楚要干啥的extention"

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          
            tableView.deselectRow(at: indexPath, animated: true)
        
       }

}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titles[indexPath.row]
        cell.backgroundColor = .white
        cell.textLabel?.font = .boldSystemFont(ofSize: 18)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
         
        
        return cell
//        cell.textLabel = NewsTitle
//        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}







