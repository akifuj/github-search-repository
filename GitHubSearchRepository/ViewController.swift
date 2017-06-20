//
//  ViewController.swift
//  GitHubSearchRepository
//
//  Created by 藤田哲史 on 2017/06/20.
//  Copyright © 2017年 Akifumi Fujita. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let deadline = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            self.searchBySearchBarText()
        }
        return true
    }
    
    func searchBySearchBarText() {
        if let searchText = searchBar.text {
            Alamofire.request(Router.search(q: searchText, sort: "", order: "")).responseJSON { [unowned self] response in
                switch response.result {
                case .success:
                    let json = JSON(response.data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // 検索ワードを受け取ってサーバ通信 or ローカルのデータを絞り込む処理を行う
    func search(text: String) {}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

