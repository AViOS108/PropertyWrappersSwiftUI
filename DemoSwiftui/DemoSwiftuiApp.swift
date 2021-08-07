//
//  DemoSwiftuiApp.swift
//  DemoSwiftui
//
//  Created by Anurag Bhakuni on 04/08/21.
//

import SwiftUI

@main
struct DemoSwiftuiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

