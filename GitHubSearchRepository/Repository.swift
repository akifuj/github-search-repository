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
    let fullname: String
    let description: String
    let language: String
    let html_url: String
    
    init(json: JSON) {
        self.fullname = json["full_name"].stringValue
        self.description = json["description"].stringValue
        self.language = json["language"].stringValue
        self.html_url = json["html_url"].stringValue
    }
}
