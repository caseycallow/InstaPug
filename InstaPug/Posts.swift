//
//  Posts.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import Foundation

struct Posts: Codable {
    public let results: [URL]
    
    enum CodingKeys: String, CodingKey {
        case results = "pugs"
    }
}
