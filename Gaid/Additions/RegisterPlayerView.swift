//
//  RegisterPlayerView.swift
//  Gaid
//
//  Created by Ali Alawami on 28/05/2022.
//

import SwiftUI

struct TextViewsCust: Identifiable{
    var id:UUID = UUID()
    var myView: AnyView
}

struct RegisterPlayerView: View {
    @ObservedObject var gameBoard:GameBoard
    @State var names = [String]()
    @State var name1 = String()
    @State var name2 = String()
    @State var name3 = String()
    @State var name4 = String()
    
    
    init(gameBoard:GameBoard){
        self.gameBoard = gameBoard
    
        
        
        gameBoard.namingPlayers(names: ["Ahmed", "Ali", "Jassim", "Hassan"], groupsNames: [])
//        gameBoard.startShuffler(id: 1)

    }
    var body: some View {
        VStack{
//            List(1 ..< 4) { player in
                VStack {
                    
                    TextField(LocalizedStringKey("Player Name"), text: $name1)
                        .padding()
                    TextField(LocalizedStringKey("Player Name"), text: $name2)
                        .padding()
                    TextField(LocalizedStringKey("Player Name"), text: $name3)
                        .padding()
                    TextField(LocalizedStringKey("Player Name"), text: $name4)
                        .padding()
                  
                }
//                .padding()
                .frame(maxWidth:.infinity)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke( Color.black)
            )
                
//            }

        }
    }
}

struct RegisterPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPlayerView(
            gameBoard: GameBoard(id: 1, gameName: GameNames.Tarnib))
    }
}

struct CustomTextView: View{
    @State var text:String = ""
    var placeHolder:String
    var body: some View {
        TextField(LocalizedStringKey(placeHolder), text: $text)
    }
    
}