//
//  GameBoardView.swift
//  Gaid
//
//  Created by Ali Alawami on 27/05/2022.
//

import SwiftUI

struct GameBoardView: View {
    
    @ObservedObject var gameBoard:GameBoard
    @State var registerNames:Bool = true
    
    
    init(gameBoard:GameBoard){
        self.gameBoard = gameBoard
    
        
        
        gameBoard.namingPlayers(names: ["Ahmed", "Ali", "Jassim", "Hassan"], groupsNames: [])
//        gameBoard.startShuffler(id: 1)

    }
    
    var body: some View {
        VStack{
            List(gameBoard.players) { player in
                VStack {
                    Text("Cuurent \(player.currentOrder)")
                    HStack {
                        Text("\(player.id)")
                        Text(player.name)
                        Text("Total \(player.total())")
                        
    //                    Text("\(player.playerID() == gameBoard.shufflerID)")
                    }
                  
                }
                .frame(maxWidth:.infinity)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(player.id == gameBoard.shufflerID ? Color.red : Color.black)
            )
                
            }

        }
        .navigationTitle(gameBoard.gameName.rawValue)
        .sheet(isPresented: $registerNames) {
            
        }
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameBoardView(gameBoard: GameBoard(id: 1, gameName: GameNames.Tarnib))
        }
    }
}
