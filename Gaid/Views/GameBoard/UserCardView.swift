//
//  UserCardView.swift
//  Gaid
//
//  Created by Ali Alawami on 09/06/2022.
//

import SwiftUI

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
                }
                ZStack {
                    CurvedRect()
                        .fill(Color.myPrimaryColor, style: FillStyle.init(eoFill: false, antialiased: false))
                    Text("152")
                        .font(.system(size: 24, weight: .regular, design: .rounded))
                        .foregroundColor(.mySecondaryColor)
                }
            }
        }
        .aspectRatio(1 ,contentMode: .fit)
    }
}
struct UserCardView_Previews: PreviewProvider {
    static var previews: some View {
        UserCardView()
    }
}
