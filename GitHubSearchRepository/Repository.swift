//
//  Repository.swift
//  GitHubSearchRepository
//
//  Created by 藤田哲史 on 2017/06/20.
//  Copyright © 2017年 Akifumi Fujita. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Repository {
    let id: Int
    let name: String
    let fullname: String
    let owner: User
    let description: String
    let language: String
    let url: String
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.fullname = json["fullname"].stringValue
        self.description = json["description"].stringValue
        self.language = json["language"].stringValue
        self.url = json["url"].stringValue
        self.owner = User(json: json["owner"])
    }
}
