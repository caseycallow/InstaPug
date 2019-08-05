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
    
    fileprivate var api = APIClient()
    fileprivate var tasks = [URLSessionTask]()
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
                        self.refreshCells()
                    }
                } else {
                    print("Failed to decode response")
                }
            case .failure(let error):
                print("Error perform network request: \(error)")
            }
        }
    }
    
    private func refreshCells() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
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

// MARK - Prefetching

extension PostViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
//        indexPaths.forEach { self.downloadImage(forItemAt: $0) }
        // if post already exists at indexPath, dont call, otherwise load more
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
//        indexPaths.forEach { self.cancelDownloadingImage(forItemAt: $0) }
    }
}

// pull all API requests out of VC
// new file AppAPIClient
