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
    
    fileprivate let api = APIClient()
    fileprivate let collectionView = PostCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchPosts()
    }
    
    func fetchPosts() {
        let request = APIRequest(method: .get, path: "bomb")
        let batchSize = 50
        
        request.queryItems = [URLQueryItem(name: "count", value: String(batchSize))]
        
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
    
    func handleFavorite(for cell: PostViewCell) {
        if let indexPath = self.collectionView.indexPath(for: cell) {
            var post = self.posts[indexPath.item]
            
            post.isFavorited = !post.isFavorited
            cell.post = post
        }
    }
    
    // MARK : UI
    
    private func setupCollectionView() {
        view.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        
        collectionView.fillSuperviewSafeAreaLayoutGuide()
        [view, collectionView].forEach { $0?.backgroundColor = .white }
    }
}
