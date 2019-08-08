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
    
    fileprivate lazy var refreshControl = UIRefreshControl()
    fileprivate lazy var refreshLabel = RefreshControlLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints()
        setupCollectionView()
        setupNavigationBar()
        setupPullToRefresh()
        fetchPosts()
    }
    
    public func fetchPosts() {
        postAPI.fetch() { [weak self] (fetchedPosts, error) in
            guard let self = self else { return }
            
            fetchedPosts?.forEach { self.posts.append($0) }
            
            DispatchQueue.main.async {
                self?.updateLoadingUI(error)
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
    
    private func updateLoadingUI(_ error: Error?) {
        collectionView.reloadData()
        refreshControl.endRefreshing()
        refreshLabel.configure(loading: false, failed: false)
    
        if error != nil {
            refreshLabel.configure(loading: false, failed: true)
        }
    }
    
    // MARK : UI
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        
        [view, collectionView].forEach { $0?.backgroundColor = .white }
    }
    
    private func setupConstraints() {
        view.addSubview(collectionView)
        collectionView.addSubview(refreshLabel)
        
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor)
        
        refreshLabel.anchor(top: collectionView.topAnchor,
                                   leading: nil,
                                   bottom: nil,
                                   trailing: nil,
                                   padding: .allSides(Space.six))
        
        refreshLabel.centerXToSuperview()
    }
    
    private func setupNavigationBar() {
        title = "Pugs"
    }
}
