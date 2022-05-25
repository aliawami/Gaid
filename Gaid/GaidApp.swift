//
//  GaidApp.swift
//  Gaid
//
//  Created by Ali Alawami on 26/05/2022.
//

import SwiftUI

@main
struct GaidApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
