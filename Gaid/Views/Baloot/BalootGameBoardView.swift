//
//  BalootGameBoardView.swift
//  Gaid
//
//  Created by Ali Alawami on 08/06/2022.
//

import SwiftUI




struct BalootGameBoardView: View {
    enum Field{
        case us, them, submit
    }
    
    var gameName:GameNames = .Baloot
    @ObservedObject var balootController: BalootGameController
    @State var ourScore: String = ""
    @State var theirScore: String = ""
    var us = Array.init(repeating: "40", count: 5)
    @FocusState var focusedItem:Bool
    @FocusState var focusedField:Field?
    
    @State var nextDealer:Int = 0
    @State var degree:Angle = Angle(degrees: 0)
    
    init(gameName: GameNames){
        balootController = BalootGameController(id: 1, gameName: gameName)
        balootController.newGame()
        balootController.ballogInital()
        self.gameName = gameName
    }
    
    var body: some View {
        //        ScrollView {
        VStack  {
            VStack{
                
                HStack {
                    Spacer()
                    UserCardView(gameName: self.gameName, player: $balootController.players.first!)
                        .overlay(Rectangle().stroke(Color.highlightColor))
                    //                        .padding()
                        .frame(width: 100)
                        .padding()
                    
                    Spacer()
                    
                    Button {
                        theNextDealer()
                    } label: {
                        Image(systemName: "arrow.up")
                            .padding()
                            .font(.system(size: 24, weight: .medium, design: .monospaced))
                            .rotationEffect(Angle(degrees: Double(nextDealer) * -90))
                    }
                    
                    
                    .overlay(Circle().stroke(Color.mySecondaryColor))
                    .padding()
                    Spacer()
                    UserCardView(gameName: self.gameName, player: $balootController.players.last!)
                        .overlay(Rectangle().stroke(Color.highlightColor))
                        .frame(width: 100)
                        .padding()
                    Spacer()
                }
                .padding(.vertical, 20)
                
                
                ZStack(alignment:.center) {
                    Rectangle()
                        .fill(Color.lineColor)
                        .frame(width:1)
                        .padding(.top)
                        .frame(maxHeight:.infinity)
//                        .offset(y: -100)
                    VStack{
                        HStack{
                            ForEach(balootController.players, id:\.id) { player in
                                VStack{
                                    Text(player.name)
                                        .font(.system(size: 24, weight: .medium, design: .rounded))
                                        .foregroundColor(Color.mySecondaryColor)
                                        .frame(maxWidth:.infinity)
                                    Rectangle()
                                        .fill(Color.lineColor)
                                        .frame(height:1)
                                }

    //                            Rectangle()
    //                                .fill(Color.lineColor)
    //                                .frame(width:1)
    //                                .padding(.top)
                            }
                        }
    //                    Spacer()
                        
                        ScrollView(.vertical, showsIndicators: false){
                            HStack{
                                ForEach(balootController.players, id:\.id) { player in
                                    VStack{
                                    ForEach(Array(player.scores.enumerated()), id:\.0){ _ , item in
                                        Text(item == -1 ? " " : "\(item)")
                                            .foregroundColor(.highlightColor)
                                            .padding(.vertical,6)
                                            .frame(maxWidth:.infinity)
                                        Divider()
                                    }
                                    }
    //                                if player.id != balootController.players.last!.id{
    //                                    Rectangle()
    //                                        .fill(Color.lineColor)
    //                                        .frame(width:1)
    //                                        .padding(.top)
    //                                        .frame(maxHeight:.infinity)
    //                                        .offset(y: -100)
    //                                }
                                }
                                
                            }
    //                        .frame(height:.infinity)
                            
                        }
    //                    .frame(height:.infinity)
                    }
                    .padding(.vertical)
                }
//                .frame(height:.infinity)
            }
            Spacer()
            HStack(spacing:0){
                TextField(LocalizedStringKey("0"), text: $ourScore)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 9)
                    .focused($focusedItem)
                    .submitLabel(.next)
                    .focused($focusedField, equals: .us)
//                    .textContentType(UIKit.UITextContentType?.)
                //                    .onTapGesture {
                //                        self.showKeyboar.toggle()
                //                    }
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: RoundedCornerStyle.circular)
                            .stroke()
                    )
                    .padding(.horizontal)
                
                Text(LocalizedStringKey("Enter"))
                    .foregroundColor(.white)
                    .font(.title)
                    .focused($focusedField, equals: .submit)
                    .lineLimit(1)
                    .padding(20)
                    .background(Circle().fill(Color.mySecondaryColor))
                    .overlay(
                        Circle()
                            .stroke(Color.highlightColor, lineWidth: 1)
                        
                    )
                    .shadow(color: Color.lineColor.opacity(0.5), radius: 6, x: 0, y: 4)
                    .onTapGesture {
                        submittingScores()
                        focusedItem = false
                    }
                
                TextField(LocalizedStringKey("0"), text: $theirScore)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 9)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: RoundedCornerStyle.circular)
                            .stroke()
                    )
                    .focused($focusedField, equals: .them)
//                    .textContentType(.givenName)
                                    
                    .padding(.horizontal)
                    .focused($focusedItem)
                    .submitLabel(.done)
                    
            }
            
            //
            //            Spacer()
            
            
            
        }
        .background(Color.myPrimaryColor)
        .keyboardType(UIKit.UIKeyboardType.numberPad)
        .onSubmit {
            switch focusedField{
            case .us:
                focusedField = .them
            case .them:
                focusedField = .submit
                submittingScores()
//                focusedItem = false
            default:
                focusedItem = false
            }
        }
        .toolbar {
            ToolbarItem.init(placement: SwiftUI.ToolbarItemPlacement.keyboard) {
                Button {
                    switch focusedField{
                    case .us:
                        focusedField = .them
                    case .them:
//                        focusedField = .submit
                        submittingScores()
                        focusedItem = false
                    default:
                        focusedItem = false
                    }
                } label: {
                    Text(focusedField == .us ?  "Next" : "Done")
                }

            }
        }
        
                
    }
    
    
    func theNextDealer(){
        if nextDealer < 3{
            nextDealer += 1
        }else{
            nextDealer = 0
        }
    }
    
    func submittingScores(){
        if !ourScore.isEmpty && !theirScore.isEmpty{
            let scors = [Int(ourScore)!, Int(theirScore)!]
            balootController.regsiterScore(scors: scors)
            ourScore = ""
            theirScore = ""
            theNextDealer()
            
//                            balootController.balootShuffeler(id: balootController.shufflerID)
            
        }
    }
}

struct BalootGameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        BalootGameBoardView(gameName: .Baloot)
    }
}


