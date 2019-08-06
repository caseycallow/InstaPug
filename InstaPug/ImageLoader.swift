//
//  ImageLoader.swift
//  InstaPug
//
//  Created by Casey Callow on 8/5/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit
import Kingfisher

class ImageLoader {
    
    public func loadImage(from url: URL, for cell: PostViewCell) {
        let imageView = cell.imageView
        
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
    }
}
