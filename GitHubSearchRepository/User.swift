//
//  User.swift
//  GitHubSearchRepository
//
//  Created by 藤田哲史 on 2017/06/20.
//  Copyright © 2017年 Akifumi Fujita. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    let id: Int
    let login: String
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.login = json["login"].stringValue
    }
}
