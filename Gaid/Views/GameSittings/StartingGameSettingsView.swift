//
//  StartingGameSettingsView.swift
//  Gaid
//
//  Created by Ali Alawami on 28/05/2022.
//

import SwiftUI

struct StartingGameSettingsView: View {
    var gameSelected: GameNames
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .navigationTitle(gameSelected.rawValue)
    }
}

struct StartingGameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            StartingGameSettingsView(gameSelected: GameNames.Tarnib)
        }
    }
}
