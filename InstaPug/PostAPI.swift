//
//  PostAPI.swift
//  InstaPug
//
//  Created by Casey Callow on 8/6/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import Foundation

enum PostAPIError: Error {
    case failedToDecode
}

class PostAPI {

    fileprivate var api = APIClient()
    
    public func fetch(completion: @escaping ([Post]?, Error?) -> ()) {
        
        var fetchedPosts = [Post]()
        let request = APIRequest(method: .get, path: "bomb")
        let batchSize = 50
        
        request.queryItems = [URLQueryItem(name: "count", value: String(batchSize))]
        
        api.perform(request) { (result) in
            switch result {
            case .success(let response):
                if let response = try? response.decode(to: Posts.self) {
                    let posts = response.body
                    for url in posts.results {
                        let post = Post(imageURL: url)
                        fetchedPosts.append(post)
                    }
                } else {
                    completion(nil, PostAPIError.failedToDecode)
                }
                
                completion(fetchedPosts, nil)
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
