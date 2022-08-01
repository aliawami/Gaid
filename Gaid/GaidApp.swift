//
//  GaidApp.swift
//  Gaid
//
//  Created by Ali Alawami on 26/05/2022.
//

import SwiftUI

@main
struct GaidApp: App {
//    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                BalootGameBoardView(gameName: .Baloot)
//                StartingGameView()
            }
//            RegisterPlayerView(gameBoard: GameBoard(id: 1, gameName: GameNames.Tarnib))
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
