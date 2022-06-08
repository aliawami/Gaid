//
//  BalootGameBoardView.swift
//  Gaid
//
//  Created by Ali Alawami on 08/06/2022.
//

import SwiftUI

struct BalootGameBoardView: View {
    var body: some View {
        GeometryReader { geometry in
            Path{ path in
                
                let width: CGFloat = min(geometry.size.width / 2 , geometry.size.height / 2)
                let height = width
//                let xScale: CGFloat = 0.832
//                let xOffset = (width * (1.0 - xScale)) / 2.0
                
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to:
                CGPoint(x: width * 2, y: 0))
                path.addCurve(to: CGPoint(x: width, y: height * 2), control1: CGPoint(x: width * 2, y: height * 1.45), control2: CGPoint(x: width * 2, y: height * 2))
                path.addLine(to:
                CGPoint(x: width * 2, y: height * 2))
                path.addLine(to:
                CGPoint(x: 0, y: height * 2))
                
                
            }
            .fill(.blue)
        }
//        ZStack {
//            Ellipse()
//                .stroke()
//
//            Rectangle().stroke()
//        }
    }
}

struct BalootGameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        BalootGameBoardView()
    }
}
