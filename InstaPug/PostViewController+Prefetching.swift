//
//  PostViewController+Prefetching.swift
//  InstaPug
//
//  Created by Casey Callow on 8/5/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit
import Kingfisher

extension PostViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        let urls = indexPaths.compactMap { posts[$0.item].imageURL }
        ImagePrefetcher(urls: urls).start()
    }
    
    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        
        let urls = indexPaths.compactMap { posts[$0.item].imageURL }
        ImagePrefetcher(urls: urls).stop()
    }
}
