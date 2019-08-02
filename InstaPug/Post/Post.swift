//
//  Post.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import Foundation

struct Post: Codable {
    public let imageURL: URL
    public var totalLikes: Int {
        let hash = abs(imageURL.absoluteURL.hashValue % 10)
        return hash
    }
}
