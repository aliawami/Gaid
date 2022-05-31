//
//  RegisterPlayersView.swift
//  Gaid
//
//  Created by Ali Alawami on 27/05/2022.
//

import SwiftUI

struct RegisterPlayersView: View {
    @State var names1 = String()
    @State var names2 = String()
    @State var names3 = String()
    @State var names4 = String()
    @State var names = [Array.init(repeating: "", count: 4)]
    var body: some View {
        VStack{
                TextField(LocalizedStringKey("Player 1"), text: $names1)
                .padding()
            TextField(LocalizedStringKey("Player 2"), text: $names2)
            .padding()
            TextField(LocalizedStringKey("Player 3"), text: $names3)
            .padding()
            TextField(LocalizedStringKey("Player 4"), text: $names4)
            .padding()

        }
    }
}

struct RegisterPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlayersView()
    }
}
