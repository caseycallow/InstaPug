//
//  PostViewController+Delegate.swift
//  InstaPug
//
//  Created by Casey Callow on 8/5/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

extension PostViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let offset = 15
        let offsetReached = indexPath.item == posts.count - offset
        let endOfListReached = indexPath.item == posts.count - 1
        
        if (offsetReached || endOfListReached) {
            loadMoreData()
        }
    }
    
    private func loadMoreData() {
        fetchPosts()
    }
}
