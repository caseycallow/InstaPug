//
//  PostViewDataSource.swift
//  InstaPug
//
//  Created by Casey Callow on 8/2/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class PostViewDataSource: NSObject, UICollectionViewDataSource {
    var posts = [Post]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PostViewCell
        let post = posts[indexPath.item]
        
        cell.configure(post)
        
        return cell
    }
}
