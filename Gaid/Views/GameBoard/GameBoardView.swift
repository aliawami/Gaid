//
//  GameBoardView.swift
//  Gaid
//
//  Created by Ali Alawami on 27/05/2022.
//

import SwiftUI


struct GameBoardView: View {
    @State var buy:String = "0"
    var gameName:GameNames
    @ObservedObject var gameBoard:GameBoard
    @State var registerNames:Bool = false
    @State var isNewGame:Bool = false
    @State var isBuying:Bool = false
    @State var degree:Angle = Angle(degrees: 0)
    @State var userBuy:String = ""
    
    
    init(gameName: GameNames){
        
        self.gameName = gameName
            self.gameBoard = GameBoard(id: 1, gameName: gameName)
            gameBoard.namingPlayers(names: Array.init(repeating: "Player", count: 4), groupsNames: [])

    }

    var body: some View {
        VStack {
//            ZStack(alignment: .center){
//            Spacer()
            HStack{
                ForEach(Array(gameBoard.players.enumerated()), id: \.0){ index,  player in
                    VStack{
                        UserCardView(gameName: self.gameName, player: $gameBoard.players[index])
                        Spacer()
                        TextField(LocalizedStringKey("0"), text: $userBuy)
                            .padding()
                    }
//                    VStack{
//                        UserCardView(gameName: self.gameName)
//                        Spacer()
//                        TextField(LocalizedStringKey("0"), text: $userBuy)
//                            .padding()
//                    }
//                    VStack{
//                        UserCardView(gameName: self.gameName)
//                        Spacer()
//                        TextField(LocalizedStringKey("0"), text: $userBuy)
//                            .padding()
//                    }
//                    VStack{
//                        UserCardView(gameName: self.gameName)
//                        Spacer()
//                        TextField(LocalizedStringKey("0"), text: $userBuy)
//                            .padding()
//                    }
                }
//                UserCardView()
//                UserCardView()
//                UserCardView()
            }
//            .fixedSize(horizontal: false, vertical: true)
                
//            HStack(spacing: 40){
//                    UserCardView()
//                    VStack(spacing: 30){
//                        UserCardView()
//                        Button {
//                        //                withAnimation{
//                                            gameBoard.shuffeler()
//                        //                }
//                                    } label: {
//                        //                switch(gameBoard.shufflerID)
//
//                                        Image(systemName: "arrow.up")
//                                            .padding()
//                                            .font(.system(size: 24, weight: .medium, design: .monospaced))
//                                            .rotationEffect(Angle(degrees: Double(((gameBoard.shufflerID - 1) * -90))))
//                                    }
//                                    .padding()
//                                    .overlay(Circle().stroke(Color.mySecondaryColor))
////                                    .padding()
//                        UserCardView()
//                    }
//                    UserCardView()
//                }
//
//
////            }
//            .frame(height: 550)
//
            
    //        VStack{
    //            ForEach(0 ..< gameBoard.players.count, id: \.self) { playerID in
    //                PlayerCardView(player: $gameBoard.players[playerID], isBuying: $isBuying)
    //                .frame(maxWidth:.infinity)
    //                .padding()
    //                .overlay(
    //                    RoundedRectangle(cornerRadius: 8)
    //                        .stroke(gameBoard.players[playerID].id == gameBoard.shufflerID ? Color.red : Color.black)
    //            )
    //
    //            }
    //
    //            Spacer()
    //            Button {
    ////                withAnimation{
    //                    gameBoard.shuffeler()
    ////                }
    //            } label: {
    ////                switch(gameBoard.shufflerID)
    //
    //                Image(systemName: "arrow.forward")
    //                    .font(.largeTitle)
    //                    .rotationEffect(Angle(degrees: Double(((gameBoard.shufflerID - 1) * -90))))
    //            }
    //            Spacer()
    //
    //            Button {
    //                isBuying.toggle()
    //            } label: {
    //                if isBuying{
    //                    Text("Play")
    //                }else{
    //                    Text("Buy")
    //                }
    //            }
    //
    //
    //        }
            .padding()
            .onAppear(perform: {
    //            registerNames.toggle()
                
            })
            .navigationTitle(gameBoard.gameName.rawValue)
            .sheet(isPresented: $registerNames, onDismiss: {
                isBuying.toggle()
            }, content: {
                RegisterPlayersView(gameBoard: gameBoard)
            })
            
            
            .toolbar {
                Button {
                    isNewGame.toggle()
                    gameBoard.newGame()
                    registerNames.toggle()
                    
                } label: {
                    Text(LocalizedStringKey("New"))
                }

        }
        }
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameBoardView(gameName: GameNames.Tarnib)
        }
    }
}
