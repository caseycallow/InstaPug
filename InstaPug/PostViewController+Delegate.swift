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
        
        if indexPath.item == posts.count - 1 {
            loadMoreData()
        }
    }
    
    private func loadMoreData() {
        fetchPosts()
    }
}
