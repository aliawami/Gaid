//
//  TarnibBoardView.swift
//  Gaid
//
//  Created by Ali Alawami on 28/05/2022.
//

import SwiftUI

struct TarnibBoardView: View {
    @EnvironmentObject var gameBoard:GameBoard
    
    init(){
        gameBoard.namingPlayers(names: ["Ahmed", "Ali", "Jassim", "Hassan"], groupsNames: [])
    }
    
    var body: some View {
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
}

//struct TarnibBoardView_Previews: PreviewProvider {
//    static var previews: some View {
//        TarnibBoardView()
//            .environmentObject(GameBoard(id: 2, gameName: .Tarnib))
//    }
//}
