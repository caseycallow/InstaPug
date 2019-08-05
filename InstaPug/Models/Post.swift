//
//  Post.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

struct Post {
    public let imageURL: URL
    public var isLiked: Bool = false
    public var totalLikes: Int {
        let hash = abs(imageURL.absoluteURL.hashValue % 10)
        return hash
    }
    
    init(imageURL: URL) {
        self.imageURL = imageURL
    }
}
