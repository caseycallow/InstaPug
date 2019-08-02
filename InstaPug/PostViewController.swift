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
    private let cellID = "postCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    private func fetchPosts() {
        let request = APIRequest(method: .get, path: "bomb")
        request.queryItems = [URLQueryItem(name: "count", value: "50")]
        
        APIClient().perform(request) { (result) in
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
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.register(PostViewCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)
        
        return collectionView
    }()
    
    private func setupUI() {
        collectionView.fillSuperviewSafeAreaLayoutGuide()
        [view, collectionView].forEach { $0?.backgroundColor = .white }
    }
}

// MARK: Delegate + Data Source

extension PostViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PostViewCell
//        let post = posts[indexPath.item]
        
        return cell
    }
    
    
}
