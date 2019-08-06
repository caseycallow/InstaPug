//
//  PostAPI.swift
//  InstaPug
//
//  Created by Casey Callow on 8/6/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import Foundation

class PostAPI {

    fileprivate var api = APIClient()
    
    public func fetch(completion: @escaping ([Post]) -> ()) {
        
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
                    print("Failed to decode response")
                }
                
                completion(fetchedPosts)
                
            case .failure(let error):
                print("Error perform network request: \(error)")
            }
        }
    }
}
