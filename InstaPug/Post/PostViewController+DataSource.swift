//
//  PostViewController+DataSource.swift
//  InstaPug
//
//  Created by Casey Callow on 8/5/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit
import Kingfisher

extension PostViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(PostViewCell.self, for: indexPath)
        let post = posts[indexPath.item]
        
        ImageLoader().loadImage(from: post.imageURL, for: cell)
        
        cell.configure(with: post)
        
        return cell
    }
}
