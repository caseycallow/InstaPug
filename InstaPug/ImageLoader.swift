//
//  ImageLoader.swift
//  InstaPug
//
//  Created by Casey Callow on 8/5/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit
import Kingfisher

// Kingfisher dependency used here to build in lazy loading
// with animation and caching. It also has native support
// for prefetching to further boost performance, which is
// implemented in `PostViewController+Prefetching`

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
