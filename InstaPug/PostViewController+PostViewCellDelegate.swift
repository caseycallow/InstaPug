//
//  PostViewController+PostViewCellDelegate.swift
//  InstaPug
//
//  Created by Casey Callow on 8/6/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import Foundation

extension PostViewController: PostViewCellDelegate {
    
    func favoriteButtonTapped(for cell: PostViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            let post = posts[indexPath.item]
            post.isFavorited.toggle()
            cell.configure(for: post)
        }
    }
}
