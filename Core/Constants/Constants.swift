//
//  Constant.swift
//  CombineFramework
//
//  Created by Batuhan Berk Ertekin on 26.11.2024.
//

struct APIConstants {
    static let baseURL = "https://jsonplaceholder.typicode.com"
    
    enum Endpoint: String {
        case posts = "/posts"
        case comments = "/comments"
        case users = "/users"
    }
    
    static func url(for endpoint: Endpoint) -> String {
        return baseURL + endpoint.rawValue
    }
}
