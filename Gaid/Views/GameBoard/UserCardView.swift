//
//  UserCardView.swift
//  Gaid
//
//  Created by Ali Alawami on 09/06/2022.
//

import SwiftUI


enum GaidStatus{
    case play, buy, register
}

struct UserCardView: View {
    var gameName:GameNames
    @Binding var player:GamePlayer
    @State var gaidStatus: GaidStatus = .buy
    @State var buy:String = ""
    var body: some View {
        VStack {
            if gameName == .Tarnib{
            Text("Player")
                .font(.system(size: 12, weight: .regular, design: .monospaced))
            }
            ZStack {
                
                    ZStack(alignment: .bottomTrailing) {
                        Rectangle()
                            .fill(Color.mySecondaryColor, style: FillStyle.init(eoFill: false, antialiased: false))
                        if gameName == .Tarnib{
                        Text(LocalizedStringKey("23"))
                            .font(.system(size: 12))
                            .padding(.horizontal, 7)
                            .padding(.vertical, 5)
                            .foregroundColor(.white)
                    }
                }
                ZStack {
                    CurvedRect()
                        .fill(Color.myPrimaryColor, style: FillStyle.init(eoFill: false, antialiased: false))
                    Text("\(player.finalScore)")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                        .foregroundColor(.mySecondaryColor)
                }
            }
            .aspectRatio(1 ,contentMode: .fit)
            if gameName == .Tarnib{
                switch(gaidStatus){
                case .buy:
                    TextField(LocalizedStringKey("0"), text: $buy)
                        .padding()
                case .register:
                    HStack{
                        Button {
                            
                        } label: {
                            Text("Win")
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Lose")
                        }

                    }
                case .play:
                    Text("")
                }
            }
                
        }
        
    }
}
struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView(gameName: .Tarnib, player: .constant(GamePlayer(id: 2)))
    }
}
