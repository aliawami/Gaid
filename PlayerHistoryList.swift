//
//  PlayerHistoryList.swift
//  Gaid
//
//  Created by Ali Alawami on 24/06/2022.
//

import SwiftUI

struct PlayerHistoryList: View {
    var us = Array.init(repeating: "40", count: 5)
    var body: some View {
        VStack {
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
        }
    }
}

struct PlayerHistoryList_Previews: PreviewProvider {
    static var previews: some View {
        PlayerHistoryList()
    }
}
