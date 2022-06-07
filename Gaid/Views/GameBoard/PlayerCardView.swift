//
//  PlayerCardView.swift
//  Gaid
//
//  Created by Ali Alawami on 03/06/2022.
//

import SwiftUI

struct PlayerCardView: View {
    let gameRule = GameRules()
    @Binding var player:GamePlayer
    @State var buy:String = ""
    @Binding var isBuying:Bool
    var body: some View {
        VStack {
            //                    var buy:String = "0"
            if isBuying{
                //                TextField(LocalizedStringKey("Buying"), value: $buy, format: <#T##ParseableFormatStyle#>)
                TextField(LocalizedStringKey("Buying"), text: $buy)
                    .onChange(of: buy, perform: { newValue in
                        if !newValue.isEmpty{
                            player.newOrder(Int(buy)!)
                        }
                    })
                    .keyboardType(UIKeyboardType.numberPad)
                //                    .onSubmit {
                //                        print("The buy is \(buy) and in Int \(Int(buy) ?? 2)")
                //                        player.newOrder(Int(buy)!)
                //                    }
            }else{
                Text("Cuurent \(player.currentOrder)")
            }
            
            HStack {
                Text("Buy: \(player.theCurrentOrder())")
                
                Text(player.name)
                Text("Total \(player.total())")
                
            }
            
        }
        .textFieldStyle(.roundedBorder)
        .onAppear {
            buy = "\(gameRule.checkMinimumBuyingAmmount(player.total()))"
        }
        .onChange(of: isBuying) { newValue in
            if newValue{
                if player.theCurrentOrder() != Int(buy)!{
                    player.newOrder(Int(buy)!)
                }
                buy = "\(gameRule.checkMinimumBuyingAmmount(player.total()))"
            }else{
                
            }
        }
        
    }
}

struct PlayerCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCardView(player: .constant(GamePlayer(id: 1)), isBuying: .constant(true))
    }
}
