//
//  PostViewController.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    public var posts: [Post] = []

    let postAPI = PostAPI()
    let collectionView = PostCollectionView()
    
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavigationBar()
        setupPullToRefresh()
        fetchPosts()
    }
    
    public func fetchPosts() {
        postAPI.fetch() { [weak self] posts in
            self?.posts += posts
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    // MARK: Pull to Refresh
    
    private func setupPullToRefresh() {
        collectionView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
    }
    
    @objc private func pullToRefresh() {
        fetchPosts()
    }
    
    // MARK : UI
    
    private func setupCollectionView() {
        view.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
        [view, collectionView].forEach { $0?.backgroundColor = .white }
    }
    
    private func setupNavigationBar() {
        title = "Pugs"
    }
}
