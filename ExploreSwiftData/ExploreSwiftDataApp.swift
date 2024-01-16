//
//  ExploreSwiftDataApp.swift
//  ExploreSwiftData
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import SwiftUI
import SwiftData

@main
struct ExploreSwiftDataApp: App {
    @StateObject private var userFetcher = UserFetcher()
    
    var body: some Scene {
        WindowGroup {
            UsersView()
                .modelContainer(for: UserModel.self)
                .environmentObject(userFetcher)
        }
    }
}
