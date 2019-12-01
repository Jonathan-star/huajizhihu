//
//  JOSNdecode.swift
//  huajizhihu
//
//  Created by 于隆祎 on 2019/11/20.
//  Copyright © 2019 于隆祎. All rights reserved.
//

import Foundation
import Alamofire

//struct Welcome: Codable {
//    let date: String
//    let stories, topStories: [Story]
//
//    enum CodingKeys: String, CodingKey {
//        case date, stories
//        case topStories = "top_stories"
//    }
//}
//
//// MARK: - Story
//struct Story: Codable {
//    let imageHue, title: String
//    let url: String
//    let hint, gaPrefix: String
//    let images: [String]?
//    let type, id: Int
//    let image: String?
//
//    enum CodingKeys: String, CodingKey {
//        case imageHue = "image_hue"
//        case title, url, hint
//        case gaPrefix = "ga_prefix"
//        case images, type, id, image
//    }
//}
//
//let session = URLSession.shared
//let url = URL(string: "https://news-at.zhihu.com/api/4/news/latest")!
//var storys: [Story]!
//
//let tesk = session.dataTask(with: url) { data, response, error in
//    if error != nil || data == nil {
//        print("Client error!")
//        return
//    }
//
//    guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
//        print("Server error!")
//        return
//    }
//
//    guard let type = response.mimeType, type == "application/json" else {
//        print("Wrong MIME type!")
//        return
//    }
//
//    do {
//        storys = try JSONDecoder().decode([Story].self, from: data!)
//
//    } catch {
//        print("JSON error: \(error.localizedDescription)")
//    }
//
//
//}
//
//
//
//
//let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
//
//
//   Alamofire.request(url).responseWelcome { response in
//     if let welcome = response.result.value {
//       
//     }
//   }



