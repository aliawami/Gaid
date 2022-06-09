//
//  BalootGameBoardView.swift
//  Gaid
//
//  Created by Ali Alawami on 08/06/2022.
//

import SwiftUI

var us = Array.init(repeating: "40", count: 9)


struct BalootGameBoardView: View {
    @State var ourScore: String = "0"
    @State var theirScore: String = "0"
    
    @State var nextDealer:Int = 0
    @State var degree:Angle = Angle(degrees: 0)
    
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
                Button {
                    if nextDealer < 3{
                        nextDealer += 1
                    }else{
                        nextDealer = 0
                    }
                } label: {
                    Image(systemName: "arrow.up")
                        .padding()
                        .font(.system(size: 24, weight: .medium, design: .monospaced))
                    .rotationEffect(Angle(degrees: Double(nextDealer) * -90))
                }

                
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
            
            HStack(spacing:0){
                TextField(LocalizedStringKey("0"), text: $ourScore)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 9)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: RoundedCornerStyle.circular)
                            .stroke()
                    )
                    .padding(.horizontal)

                    Text(LocalizedStringKey("Enter"))
                        .foregroundColor(.white)
                        .font(.title)
                
                        .lineLimit(1)
                        .padding(20)
                        .background(Circle().fill(Color.mySecondaryColor))
                        .overlay(
                            Circle()
                                .stroke(Color.highlightColor, lineWidth: 1)
                            
                        )
                        .shadow(color: Color.lineColor.opacity(0.5), radius: 6, x: 0, y: 4)

                TextField(LocalizedStringKey("0"), text: $theirScore)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 9)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8, style: RoundedCornerStyle.circular)
                            .stroke()
                    )
                    .padding(.horizontal)
            }
            
            HStack{
                VStack{
                    Text("US")
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                        .foregroundColor(Color.mySecondaryColor)
                        .frame(maxWidth:.infinity)
                    Rectangle()
                        .fill(Color.lineColor)
                        .frame(height:1)
                        
                    ForEach(Array(us.enumerated()), id:\.0){ _ , item in
                        Text(item)
                            .foregroundColor(.highlightColor)
                            .padding(.vertical,6)
                            .frame(maxWidth:.infinity)
                        Divider()
                    }
                    Spacer()
                }
                .frame(maxHeight:.infinity)
                Rectangle()
                    .fill(Color.lineColor)
                    .frame(width:1)
                    .padding(.top)
                
                VStack{
                    Text("Them")
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                        .foregroundColor(Color.mySecondaryColor)
                        .frame(maxWidth:.infinity)
                    Rectangle()
                        .fill(Color.lineColor)
                        .frame(height:1)
                    ForEach(Array(us.enumerated()), id:\.0){ _ , item in
                        Text(item)
                            .foregroundColor(.highlightColor)
                            .padding(.vertical,6)
                            .frame(maxWidth:.infinity)
                        Divider()
                    }
                    Spacer()
                }
                .frame(maxHeight:.infinity)
            }
            .padding(.vertical)
            
//
//            Spacer()

           
            
        }
        .background(Color.myPrimaryColor)
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
