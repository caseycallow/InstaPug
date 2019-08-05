//
//  PostViewCell.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class PostViewCell: UICollectionViewCell {
    
    let likeButton = LikeButton()
    let likeLabel = LikeLabel()

    public func configure(with post: Post) {
        setLabel(likes: post.totalLikes)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutComponents()
    }
  
    private func layoutComponents() {
        stack(imageView,
              stack(likeButton,
                    likeLabel,
                    spacing: 8,
                    alignment: .leading).padLeft(16),
                    spacing: 16)
            .withMargins(.init(top: 12, left: 0, bottom: 12, right: 0))
    }
    
    private func setLabel(likes: Int) {
        var hasOneLike: Bool { return likes == 1 }
        likeLabel.text = "\(likes) like\(hasOneLike ? "" : "s")"
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
