//
//  UsersView.swift
//  ExploreSwiftData
//
//  Created by Burak Kurtarır on 16.01.2024.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @EnvironmentObject private var userManager: UserFetcher
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        List {
            ForEach(userManager.users) { user in
                Text(user.name)
            }
        }
        .task {
            await userManager.fetchUsers()
        }
    }
}

//#Preview {
//    UsersView()
//}
