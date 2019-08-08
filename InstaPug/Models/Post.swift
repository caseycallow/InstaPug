//
//  Post.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class Post {
    public let imageURL: URL
    public var isFavorited: Bool = false
    public var totalFavorites: Int { return generateRandomNumberFrom(imageURL) }
    
    init(imageURL: URL) {
        self.imageURL = imageURL
    }
    
    fileprivate func generateRandomNumberFrom(_ url: URL) -> Int {
        let hash = abs(url.absoluteString.hashValue % 10 * 13)
        return hash
    }
}
