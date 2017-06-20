//
//  Router.swift
//  GitHubSearchRepository
//
//  Created by 藤田哲史 on 2017/06/20.
//  Copyright © 2017年 Akifumi Fujita. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case search(q: String, sort: String, order: String)
    
    static let baseURLString = "https://api.github.com/search/repositories"
    
    func asURLRequest() throws -> URLRequest {
        let result: (Parameters) = {
            switch self {
            case let .search(q, sort, order):
                return ["q": q, "sort": sort, "order": order]
            }
        }()
        
        let url = try Router.baseURLString.asURL()
        let urlRequest = URLRequest(url: url)
        return try URLEncoding.default.encode(urlRequest as URLRequestConvertible, with: result)
    }
}
