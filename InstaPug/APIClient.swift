//
//  APIClient.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

struct HTTPHeader {
    let field: String
    let value: String
}

class APIRequest {
    let method: HTTPMethod
    let path: String
    var queryItems: [URLQueryItem]?
    var headers: [HTTPHeader]?
    var body: Data?
    
    init(method: HTTPMethod, path: String) {
        self.method = method
        self.path = path
    }
}

enum APIError: Error {
    case invalidURL
    case requestFailed
}

struct APIClient {
    
    typealias APIClientCompletion = (HTTPURLResponse?, Data?, APIError?) -> Void
    
    private let session = URLSession.shared
    private let baseURL = URL(string: "https://pugme.herokuapp.com")!
    
    func request(_ request: APIRequest, _ completion: @escaping APIClientCompletion) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = baseURL.scheme
        urlComponents.host = baseURL.host
        urlComponents.path = baseURL.path
        urlComponents.queryItems = request.queryItems
        
        guard let url = urlComponents.url?.appendingPathComponent(request.path) else {
            completion(nil, nil, .invalidURL)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        
        request.headers?.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.field) }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                completion(nil, nil, .requestFailed)
                return
            }
            completion(httpResponse, data, nil)
        }
        task.resume()
    }
}
