//
//  ViewController.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchPosts()
    }
    
    private func fetchPosts() {
        let request = APIRequest(method: .get, path: "bomb")
        request.queryItems = [URLQueryItem(name: "count", value: "50")]
        request.headers = [HTTPHeader(field: "Content-Type", value: "application/json")]
        
        APIClient().request(request) { (_, data, _) in
            if let data = data, let result = String(data: data, encoding: .utf8) {
                print(result)
            }
        }
    }
}

