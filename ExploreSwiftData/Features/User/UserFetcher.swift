//
//  UserFetcher.swift
//  ExploreSwiftData
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import Foundation
import SwiftUI

@Observable
final class UserFetcher {
    var users = [UserModel]()
    var errorMessage: String?
    
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

extension EnvironmentValues {
    var userFetcher: UserFetcher {
        get { self[UserFetcherKey.self] }
        set { self[UserFetcherKey.self] = newValue }
    }
}

private struct UserFetcherKey: EnvironmentKey {
    static var defaultValue: UserFetcher = UserFetcher()
}
