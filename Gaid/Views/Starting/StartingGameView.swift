//
//  StartingGameView.swift
//  Gaid
//
//  Created by Ali Alawami on 28/05/2022.
//

import SwiftUI

struct StartingGameView: View {
    var body: some View {
        VStack {
            
            ForEach(GameNames.allCases, id:\.self) { item in
                NavigationLink {
                    Text(item.rawValue)
                } label: {
                    Text(LocalizedStringKey(item.rawValue))
                }
                .frame(maxWidth:.infinity)
                .padding()

                
            }
            
        }
    }
}

struct StartingGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            StartingGameView()
        }
    }
}



