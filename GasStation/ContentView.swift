//
//  ContentView.swift
//  GasStation
//
//  Created by aakash tandukar on 5/15/25.
//

import SwiftUI
import SwiftData
import Alamofire

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    
    func fetchPosts() {
        isLoading = true
        AF.request("https://jsonplaceholder.typicode.com/posts")
            .validate()
            .responseDecodable(of: [Post].self) { response in
                DispatchQueue.main.async {
                    self.isLoading = false
                    switch response.result {
                    case .success(let posts):
                        self.posts = posts
                    case .failure(let error):
                        print("Error fetching posts: \(error)")
                    }
                }
            }
    }
}

struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title).font(.headline)
                    Text(post.body).font(.subheadline)
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.fetchPosts()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
