//
//  PostViewCell.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class PostViewCell: UICollectionViewCell {
    
    public func configure(_ post: Post) {
        imageView.load(url: post.imageURL)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutComponents()
    }
  
    private func layoutComponents() {
        stack(imageView,
              stack(likeButton,
                    likeLabel, spacing: 16, alignment: .leading).padLeft(16),
                    spacing: 16).withMargins(.init(top: 16, left: 0, bottom: 16, right: 0))
    }
    
    // MARK: Components
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.setImage(UIImage(named: "heartFilled"), for: .selected)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.text = "17 Likes"
        label.font = UIFont(name: "Lato-Bold", size: 14)
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
