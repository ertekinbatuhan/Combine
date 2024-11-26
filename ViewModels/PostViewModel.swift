//
//  PostViewModel.swift
//  CombineFramework
//
//  Created by Batuhan Berk Ertekin on 26.11.2024.
//

import SwiftUI
import Combine

// ViewModel to handle networking and data flow
class PostViewModel: ObservableObject {
    // Published property to notify view of data changes
    @Published var posts: [Post] = []
    
    private var cancellable: AnyCancellable?
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        // Generate full URL for the posts endpoint
        let urlString = APIConstants.url(for: .posts)
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        // Create a URLSession data task publisher
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data) // Extract data from response
            .decode(type: [Post].self, decoder: JSONDecoder()) // Decode JSON into array of Posts
            .replaceError(with: []) // Replace errors with an empty array
            .receive(on: DispatchQueue.main) // Receive on main queue to update UI
            .sink(receiveValue: { [weak self] fetchedPosts in
                self?.posts = fetchedPosts // Update posts with fetched data
            })
    }
}
