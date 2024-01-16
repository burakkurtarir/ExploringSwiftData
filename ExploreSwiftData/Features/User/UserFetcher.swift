//
//  UserFetcher.swift
//  ExploreSwiftData
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import Foundation

@MainActor
final class UserFetcher: ObservableObject {
    @Published var users = [UserModel]()
    @Published var errorMessage: String?
    
    func fetchUsers() async {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            users = try JSONDecoder().decode([UserModel].self, from: data)
        } catch {
            errorMessage = error.localizedDescription
            print(error)
        }
        
    }
}
