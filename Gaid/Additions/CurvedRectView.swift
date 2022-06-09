//
//  CurvedRect.swift
//  Gaid
//
//  Created by Ali Alawami on 08/06/2022.
//

import SwiftUI

struct CurvedRectView: View {
    var body: some View {
        GeometryReader { geometry in
            Path{ path in
                
                let width: CGFloat = min(geometry.size.width / 2 , geometry.size.height / 2)
                let height = geometry.size.height / 2
                //                let xScale: CGFloat = 0.832
                //                let xOffset = (width * (1.0 - xScale)) / 2.0
                
                path.move(to: CGPoint(x: width , y: 10))
                path.addCurve(to: CGPoint(x: width , y: height),
                              control1: CGPoint(x: width , y:  height / 4),
                              control2: CGPoint(x: width * 2 , y: height ))
                path.move(to: CGPoint(x: width , y: 10))
                path.addCurve(to: CGPoint(x: width , y: height), control1: CGPoint(x: width, y: height / 4), control2: CGPoint(x: 0 , y: height))
//                path.addCurve(to: CGPoint(x: width / 2, y: 10), control1: CGPoint(x: width / 2, y: height / 2),
//                              control2: CGPoint(x: width , y: height ))
                //                path.move(to: CGPoint(x: 0, y: 0))
                //                path.addLine(to:
                //                CGPoint(x: width * 2, y: 0))
                //                path.addCurve(to: CGPoint(x: width, y: height * 2), control1: CGPoint(x: width * 2, y: height * 1.45), control2: CGPoint(x: width * 2, y: height * 2))
                //                path.addLine(to:
                //                CGPoint(x: width * 2, y: height * 2))
                //                path.addLine(to:
                //                CGPoint(x: 0, y: height * 2))
                
                
            }
//            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: CGLineCap.round, lineJoin: .round, dash: [1]))
                        .fill(.blue)
        }
    }
}

//extension CurvedRect: Shape{
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//
//        let width: CGFloat = rect.size.width
//        let height = rect.size.height
////                let xScale: CGFloat = 0.832
////                let xOffset = (width * (1.0 - xScale)) / 2.0
//
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to:
//            CGPoint(x: width * 2, y: 0))
//            path.addCurve(to: CGPoint(x: width, y: height * 2), control1: CGPoint(x: width * 2, y: height * 1.45), control2: CGPoint(x: width * 2, y: height * 2))
//            path.addLine(to:
//            CGPoint(x: width * 2, y: height * 2))
//            path.addLine(to:
//            CGPoint(x: 0, y: height * 2))
//
//
//        return path
//    }
//}

struct CurvedRectView_Previews: PreviewProvider {
    static var previews: some View {
        CurvedRectView()
    }
}
