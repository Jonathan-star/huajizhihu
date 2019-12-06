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
import SnapKit
import MJRefresh
import FSPagerView

//MARK: -topStory数组
var topTitles = [String]()
var topImageUrls = [String]()
var topHints = [String]()
var topStoryUrls = [String]()




//MARK: -news数组

var titles = [String]()
var imageUrls = [[String]]()
var hints = [String]()
var storyUrl = [String]()
var storyId = [String]()
var num = 0

class ViewController: UIViewController {
    var imageView = UIImageView()

    var tableView = UITableView()
    
    let pics = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 500))

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadTableview()
        loadData()
        loadSubtitle()
            
        
        
        


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
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.mj_header = MJRefreshNormalHeader()
        tableView.mj_header?.setRefreshingTarget(self, refreshingAction: #selector(loadNewData))
        
        
        loadNavigation()
        view.addSubview(tableView)
        
    }
    @objc func loadNewData() {
                
        loadData()
        loadSubtitle()
        loadNewsImage()
//        loadScrollView()
        self.tableView.reloadData()
        self.tableView.mj_header?.endRefreshing()
        
    }
    
//    MARK: -navigationBar设置
    
    func loadNavigation() {
       
        navigationController?.navigationBar.barTintColor = .green
        navigationController?.navigationBar.tintColor = .white
//        let date = Date.init()
//        let timeFormatter = DateFormatter.init()
//        timeFormatter.dateFormat="dd\nMM月"
//        let time = timeFormatter.string(from: date)
//        let dateLabel = UILabel()
//        dateLabel.text = time
//        dateLabel.textColor = .black
//        dateLabel.numberOfLines = 0
//        dateLabel.frame = CGRect(x: 20, y: 200, width: 100, height: 60)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: dateLabel)
//
        navigationItem.title = "FUNNY DAILY"
//        if let barFont = UIFont(name: "ChalkboardSE-Bold" , size: 24){
//        }

    }
    
//    MARK: -"我也不知道该不该写的"刷新
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
        loadSubtitle()
        loadNewsImage()
        loadScrollView()
        tableView.reloadData()
        print(imageUrls)
        
    }
    
//   MARK: -load some datas
        
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
    func loadSubtitle() {
        alama.alamofireGet{ hints in
            print(hints)
            self.tableView.reloadData()
        }
        if hints.isEmpty {
            print("nothing")
        } else {
            print("ok")
        }
    }
    func loadNewsImage() {
        alama.alamofireGet { imageUrls in
            
            self.tableView.reloadData()

        }
    }
    
    
//    MARK: -scrollView设置
//    let pic1 =
    
    
    func loadScrollView() {
        pics.isPagingEnabled = false
        pics.isScrollEnabled = true
        pics.bounces = false
        pics.contentSize = CGSize(width: UIScreen.main.bounds.width * 5, height: 500)
        pics.delegate = self
        pics.minimumZoomScale = 0.1
        pics.maximumZoomScale = 4
        pics.bouncesZoom = false
        pics.indicatorStyle = UIScrollView.IndicatorStyle.white
        pics.showsVerticalScrollIndicator = false
        pics.showsHorizontalScrollIndicator = false
        pics.backgroundColor = .white

//        pics.addSubview()

        pics.showsVerticalScrollIndicator = false
        pics.showsHorizontalScrollIndicator = false
    }
}
    

//MARK: -搞了一点cell
extension ViewController: UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return titles.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cellId")
//        let cell = UITableViewCell()
        cell.contentView.translatesAutoresizingMaskIntoConstraints = false
        cell.textLabel?.text = titles[indexPath.row]
        cell.backgroundColor = .white
        cell.textLabel?.font = .boldSystemFont(ofSize: 18)
        cell.textLabel?.textColor = .black
        cell.textLabel?.numberOfLines = 0
        
//        cell.textLabel?.snp.makeConstraints { make in
//            make.left.equalTo((cell.imageView?.snp.right)!).offset(20)
//            make.centerY.equalToSuperview().offset(70)
//
//        }
        cell.detailTextLabel?.text = hints[indexPath.row]
        cell.detailTextLabel?.font = .boldSystemFont(ofSize: 12)
        cell.detailTextLabel?.textColor = .darkGray
        cell.detailTextLabel?.snp.updateConstraints { make in
            
            make.top.equalTo((cell.textLabel?.snp.bottom)!).offset(10)
            make.left.equalTo((cell.textLabel?.snp.left)!)
//            make.right.equalTo(20)
//            make.bottom.equalToSuperview().offset(120)
        }
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.imageView?.sd_setImage(with: URL(string: imageUrls[indexPath.row][0]), placeholderImage: UIImage(named: "placeholder.png"))
        cell.imageView?.layer.cornerRadius = 20
        cell.imageView?.layer.masksToBounds = true
        
        cell.imageView?.snp.updateConstraints { make in
//            make.right.equalTo((cell.textLabel?.snp.right)!).offset(15)
            make.width.height.equalTo(120)
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(30)

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
// MARK: -cell push
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        num = indexPath.row
        navigationController?.pushViewController(news(), animated: true)
       
         tableView.deselectRow(at: indexPath, animated: true)
    }

}
//extension ViewController: UIScrollViewDelegate {
//
//}






