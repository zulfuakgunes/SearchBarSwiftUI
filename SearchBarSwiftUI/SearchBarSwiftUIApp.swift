//
//  SearchBarSwiftUIApp.swift
//  SearchBarSwiftUI
//
//  Created by Zülfü Akgüneş on 29.01.2024.
//

import SwiftUI

@main
struct SearchBarSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            SearchBarView()
        }
    }
}
