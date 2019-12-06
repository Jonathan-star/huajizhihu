//
//  AFdecode.swift
//  huajizhihu
//
//  Created by 于隆祎 on 2019/11/27.
//  Copyright © 2019 于隆祎. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//Alamofire.request(url).responseWelcome { response in
//    if let welcome = response.result.value {
//        ...
//    }
//}

import Alamofire
import UIKit

struct DataGet: Codable {
    let date: String?
    let stories, topStories: [Story]?

    enum CodingKeys: String, CodingKey {
        case date, stories
        case topStories = "top_stories"
    }
}

// MARK: DataGet convenience initializers and mutators

extension DataGet {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DataGet.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        date: String?? = nil,
        stories: [Story]?? = nil,
        topStories: [Story]?? = nil
    ) -> DataGet {
        return DataGet(
            date: date ?? self.date,
            stories: stories ?? self.stories,
            topStories: topStories ?? self.topStories
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseStory { response in
//     if let story = response.result.value {
//       ...
//     }
//   }

// MARK: - Story
struct Story: Codable {
    let imageHue, title: String?
    let url: String?
    let hint, gaPrefix: String?
    let images: [String]?
    let type, id: Int?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case imageHue
        case title, url, hint
        case gaPrefix
        case images, type, id, image
    }
}

// MARK: Story convenience initializers and mutators

extension Story {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Story.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        imageHue: String?? = nil,
        title: String?? = nil,
        url: String?? = nil,
        hint: String?? = nil,
        gaPrefix: String?? = nil,
        images: [String]?? = nil,
        type: Int?? = nil,
        id: Int?? = nil,
        image: String?? = nil
    ) -> Story {
        return Story(
            imageHue: imageHue ?? self.imageHue,
            title: title ?? self.title,
            url: url ?? self.url,
            hint: hint ?? self.hint,
            gaPrefix: gaPrefix ?? self.gaPrefix,
            images: images ?? self.images,
            type: type ?? self.type,
            id: id ?? self.id,
            image: image ?? self.image
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    
    return encoder
}

//MARK: -Alamofire解码

class alama {
    static func alamofireGet(someclosure:@escaping ([String]) -> Void) {
        let dataRequest: DataRequest = Alamofire.request("https://news-at.zhihu.com/api/4/news/latest")
        dataRequest.responseJSON { data in
            do {
                let datas = try JSONDecoder().decode(DataGet.self, from: data.data!)
                print(datas)
                titles.removeAll()
                hints.removeAll()
                imageUrls.removeAll()
                for story in datas.stories! {
                    
                    titles.append(story.title!)
                    hints.append(story.hint!)
                    imageUrls.append(story.images!)
                    storyUrl.append(story.url!)
                    someclosure(titles)
                }
                for topStory in datas.topStories! {
                    if let tophint = topStory.hint {
                        topHints.append(tophint)
                    }
                    topTitles.append(topStory.title!)
                    topImageUrls.append(topStory.image!)

                }
            } catch {
                print ("error")
            }
        }
    }
}

    


