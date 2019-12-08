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
var topImages = [UIImage]()
//var imageArray = [UIImage]()
//var positionArray = [CGFloat]()
//var titleArray = [String]()





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
    
    let pics = UIScrollView()
    
     
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
        navigationItem.title = "FUNNY DAILY"
        ///日期，觉得比较丑就注了
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

        ///字体，等会设置
//        if let barFont = UIFont(name: "ChalkboardSE-Bold" , size: 24){
//        }

    }
    
//    MARK: -"我也不知道该不该写的"刷新
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
        loadSubtitle()
        loadNewsImage()
        
        tableView.reloadData()
        print(imageUrls)
        
        pics.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.6)
        pics.contentSize = CGSize(width: UIScreen.main.bounds.width * 5, height: pics.frame.height)
        pics.isDirectionalLockEnabled = true
        pics.isPagingEnabled = true
        pics.alwaysBounceVertical = false
        pics.showsVerticalScrollIndicator = false
        pics.showsHorizontalScrollIndicator = false
        pics.delegate = self
        self.view.addSubview(pics)
        pics.addSubview(imageView)
        if topImageUrls.count - 1 > 0 {
            for i in 0...topImageUrls.count - 1 {
                
                imageView.sd_setImage(with: URL(string: topImageUrls[i]), placeholderImage: UIImage(named: "\(i)"))
            }
            
        }else {
            
        }
        

        
        
        
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
    
    
}
    

//MARK: -搞了一点cell
extension ViewController: UITableViewDataSource {
    
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

//MARK: ScrollView设置

extension ViewController: UIScrollViewDelegate {
    func picDidScroll(_ scrollView: UIScrollView) {
        
        
    }
}





