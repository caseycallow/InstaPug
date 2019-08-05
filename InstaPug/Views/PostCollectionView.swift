//
//  PostCollectionView.swift
//  InstaPug
//
//  Created by Casey Callow on 8/5/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class PostCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flowLayout = UICollectionViewFlowLayout()
        super.init(frame: frame, collectionViewLayout: flowLayout)
        
        setupView()
    }
    
    private func setupView() {
        register(PostViewCell.self)
        alwaysBounceVertical = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
