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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavigationBar()
        fetchPosts()
    }
    
    public func fetchPosts() {
        postAPI.fetch() { [weak self] posts in
            self?.posts += posts
            DispatchQueue.main.async { self?.collectionView.reloadData() }
        }
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
