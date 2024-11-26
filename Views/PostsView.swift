//
//  ContentView.swift
//  CombineFramework
//
//  Created by Batuhan Berk Ertekin on 26.11.2024.
//

import SwiftUI

struct PostsView: View {
    
    @ObservedObject var viewModel : PostViewModel
    
    init(viewModel: PostViewModel = PostViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            List(viewModel.posts, id: \.id) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }.navigationTitle("Posts")
        }
    }
    
    
}
#Preview {
    PostsView()
}


