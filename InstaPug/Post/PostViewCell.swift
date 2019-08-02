//
//  PostViewCell.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class PostViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func configure(_ post: Post) {
        imageView.load(url: post.imageURL)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    private func addViews() {
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
