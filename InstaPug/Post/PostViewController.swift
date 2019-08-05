//
//  PostViewController.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    var posts: [Post] = []
    var dataTasks: [URLSessionDataTask] = []
    
    fileprivate let api = APIClient()
    fileprivate let collectionView = PostCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchPosts()
    }

    // MARK: Loading Data
    
    private func fetchPosts() {
        let request = APIRequest(method: .get, path: "bomb")
        request.queryItems = [URLQueryItem(name: "count", value: "50")]
        
        api.perform(request) { (result) in
            switch result {
            case .success(let response):
                if let response = try? response.decode(to: Posts.self) {
                    let posts = response.body
                    for url in posts.results {
                        let post = Post(imageURL: url)
                        self.posts.append(post)
                        
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                } else {
                    print("Failed to decode response")
                }
            case .failure(let error):
                print("Error perform network request: \(error)")
            }
        }
    }
    
    // MARK : UI
    
    private func setupCollectionView() {
        view.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.fillSuperviewSafeAreaLayoutGuide()
        [view, collectionView].forEach { $0?.backgroundColor = .white }
    }
}

// pull all API requests out of VC
// new file AppAPIClient
