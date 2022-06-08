//
//  BalootGameBoardView.swift
//  Gaid
//
//  Created by Ali Alawami on 08/06/2022.
//

import SwiftUI

struct BalootGameBoardView: View {
    @State var ourScore: String = "0"
    @State var theirScore: String = "0"
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                UserCardView()
                            .overlay(Rectangle().stroke(Color.highlightColor))
//                        .padding()
                        .frame(width: 100)
                        .padding()
                Spacer()
                Image(systemName: "arrow.up")
                    .padding()
                    .font(.system(size: 24, weight: .medium, design: .monospaced))
                    .overlay(Circle().stroke(Color.mySecondaryColor))
                    .padding()
                Spacer()
                UserCardView()
                            .overlay(Rectangle().stroke(Color.highlightColor))
                            .frame(width: 100)
                        .padding()
                Spacer()
            }
            .padding(.vertical, 20)
            
            HStack{
                TextField(LocalizedStringKey("0"), text: $ourScore)
//                TextField(LocalizedStringKey("0"), text: $ourScore)
                ZStack {
                    Circle().fill(Color.mySecondaryColor)
                    Text(LocalizedStringKey("Enter"))
                        .foregroundColor(.white)
                        .font(.title2)
//                        .padding()
//                        .background(
                            
//                    )
//                    .padding()
                }
                .aspectRatio(1, contentMode: .fit)
                TextField(LocalizedStringKey("0"), text: $theirScore)
            }
            
            Spacer()
//                        .aspectRatio(1 ,contentMode: .fit)
//                        Spacer()
//                        .frame(height: )
           
            
        }
    }
}

struct BalootGameBoardView_Previews: PreviewProvider {
    static var previews: some View {
                    BalootGameBoardView()
    }
}

struct UserCardView: View {
    var body: some View {
        VStack {
            ZStack {
                ZStack(alignment: .bottomTrailing) {
                    Rectangle()
                        .fill(Color.mySecondaryColor, style: FillStyle.init(eoFill: false, antialiased: false))
                    Text(LocalizedStringKey("23"))
                        .font(.system(size: 12))
                        .padding(.horizontal, 7)
                        .padding(.vertical, 5)
                        .foregroundColor(.white)
                    //                        .offset(x: -20, y: -10)
                    
                }
                ZStack {
                    
                    
                    CurvedRect()
                        .fill(Color.myPrimaryColor, style: FillStyle.init(eoFill: false, antialiased: false))
                    
                    Text("152")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                    
                    //                        .fontWeight(.heavy)
                        .foregroundColor(.mySecondaryColor)
                }
                
                
                //                .background(Color.mySecondaryColor)
                
                
                
                
                
                
            }
//            .padding()
        }
        .aspectRatio(1 ,contentMode: .fit)
//        .frame(width: 200, height: 200, alignment: .center)
    }
}
